<?php 
$writer = new \Zend\Log\Writer\Stream(BP . '/var/log/test.log');
            $logger = new \Zend\Log\Logger();
            $logger->addWriter($writer);
            $logger->info(print_r($e->getMessage(), true));
//            $logger->info(print_r($e->getTrace(), true));
            $logger->info(print_r($e->getTraceAsString(), true));
            
            ?>