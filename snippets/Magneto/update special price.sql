
--
UPDATE req_sku INNER JOIN price ON req_sku.sku =price.sku SET req_sku.base_price = price.price
--
UPDATE req_sku INNER JOIN special_price ON req_sku.sku =special_price.sku SET req_sku.special_price = special_price .
special_price 
-- 
INSERT INTO  catalog_product_entity_decimal (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES 

--
(NULL,'78','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=4065424040984) , 159.00),
(NULL,'78','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=4065424037328) , 159.00),
(NULL,'78','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=4065424041004) , 159.00),
(NULL,'78','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=4065424037342) , 159.00)
 ON DUPLICATE KEY UPDATE value = VALUES(value)

--
INSERT INTO  catalog_product_entity_decimal (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES 
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040505558 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040504506 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040505299 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040504605 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040504834 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040505534 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040502687 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040505251 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040504568 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040504681 ),182.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421919 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422305 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422008 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422077 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421636 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040423760 ),250.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040424170 ),250.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040423845 ),250.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040423920 ),250.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040423586 ),250.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422534 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040423142 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422589 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422749 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422374 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040418681 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419664 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419046 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419220 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040418612 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419879 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040420356 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040420073 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040420141 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419657 ),245.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421483 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421421 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422114 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421797 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421773 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419640 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040419404 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040420189 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040420103 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040420042 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040571713 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040571706 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040571799 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040571775 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040571751 ),192.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422022 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040421940 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422510 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422367 ),310.00),
(Null,'77','0', (SELECT entity_id FROM catalog_product_entity  WHERE sku=196040422299 ),310.00)
 ON DUPLICATE KEY UPDATE value = VALUES(value)