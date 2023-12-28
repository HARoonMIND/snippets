select SSTORE_NO as store_id , to_date(PostDate, 'dd-MM-YY') as "date" , HOURID 
,WORKSTATION as terminalID
,Quarter 
,sum(NET_QTY) as Units 
,SUM(EXT_PWT_WGD) - SUM(EXT_TAX_WGD)  as "Value" 
--, sum(EXT_PWT_WGD) as "Value" 
, count(INVC_SID) as Transactions , 'N' as Operations
from (  

 SELECT  H.SBS_NO AS SUBSIDIARY , H.STORE_NO  AS SSTORE_NO , H.INVC_SID , H.INVC_NO, H.WORKSTATION ,
 to_Char(H.CREATED_DATE, 'dd-MM-yyyy HH24:MI:SS')  as OrigDate ,
 to_date(to_char(H.CREATED_DATE, 'dd-MM-yyyy HH24:MI:SS'), 'dd-MM-yyyy HH24:MI:SS') +  (({{SalesReportingTimeDiffFromUTC}}-{{POSTimeDiffFromUTC}})/1440) as PostDate ,
 to_char(to_date(to_char(H.CREATED_DATE, 'dd-MM-yyyy HH24:MI:SS'), 'dd-MM-yyyy HH24:MI:SS') +  (({{SalesReportingTimeDiffFromUTC}}-{{POSTimeDiffFromUTC}})/1440), 'HH24') as HourID ,
 Floor(to_char(to_date(to_char(H.CREATED_DATE, 'dd-MM-yyyy HH24:MI:SS'), 'dd-MM-yyyy HH24:MI:SS') +  (({{SalesReportingTimeDiffFromUTC}}-{{POSTimeDiffFromUTC}})/1440), 'MI') / 15 + 1 ) as Quarter ,
 SUM(D.QTY * H.REPORT_MODIFIER) AS NET_QTY ,
 
 --SUM(DECODE(1,       '1',       ((DECODE(H.USE_VAT, 1, D.PRICE, D.PRICE + D.TAX_AMT) *       (1 - NVL(H.DISC_PERC, 0) / 100) * D.QTY) *        H.REPORT_MODIFIER))) AS EXT_PWT_WGD 
  SUM(DECODE(1, '1', ((DECODE(H.USE_VAT, 1, D.PRICE, D.PRICE + D.TAX_AMT) * (1 - NVL(H.DISC_PERC, 0) / 100) * D.QTY) * H.REPORT_MODIFIER), CMS_REPORT.CONVERTBASECURRENCY(((DECODE(H.USE_VAT, 1, D.PRICE, D.PRICE + D.TAX_AMT) * (1 - NVL(H.DISC_PERC, 0) / 100) * D.QTY) * H.REPORT_MODIFIER), H.SBS_NO, ' 2 ', TRUNC(H.CREATED_DATE)))) AS EXT_PWT_WGD	
  , SUM(DECODE(1, '1', ((D.TAX_AMT                                        * (1 - NVL(H.DISC_PERC, 0) / 100) * D.QTY) * H.REPORT_MODIFIER), CMS_REPORT.CONVERTBASECURRENCY(((D.TAX_AMT * (1 - NVL(H.DISC_PERC, 0) / 100) * D.QTY) * H.REPORT_MODIFIER), 1, '1 ', TRUNC(H.CREATED_DATE)))) AS EXT_TAX_WGD     

FROM invn_sbs i ,
      invoice_v H ,
      invc_item D
    WHERE H.invc_sid = D.invc_sid and H.sbs_no = i.sbs_no
    AND D.item_sid  = i.item_sid
    AND H.invc_type IN (0,2)
    AND H.invc_no    > 0
    --AND H.sbs_no     = 2
    AND H.held      <> 1
    AND H.STORE_NO =  SUBSTR('{{C_StoreId}}', INSTR('{{C_StoreId}}', '-') + 1)   --Substring is used to exclude prefix of store id as it is not available in client database
 
 AND H.CREATED_DATE >= (to_date('{{SalesLastSyncTime}}','yyyy-MM-dd"T"HH24:MI:SS') - (30/1440)) 
 AND H.CREATED_DATE <  to_date('{{CurrentTime}}','yyyy-MM-dd"T"HH24:MI:SS')   
 GROUP BY H.SBS_NO , H.STORE_NO , H.INVC_SID , H.INVC_NO  , H.CREATED_DATE , H.POST_HOUR, H.WORKSTATION
     
) 
group by SSTORE_NO  , to_date(PostDate, 'dd-MM-YY') , HourID , quarter , WORKSTATION
order by to_date(PostDate, 'dd-MM-YY') , HourID , quarter