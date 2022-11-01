<?php
namespace Mageplaza\HelloWorld\Post;
class Post extends \Magento\Framework\View\Element\Template
{
        protected $_logger;
 
    public function __construct(
        \Magento\Backend\Block\Template\Context $context,
        \Psr\Log\LoggerInterface $logger,
        array $data = []
    )
    {        
        $this->_logger = $logger;
        parent::__construct($context, $data);
    }
    
    public function testLogging() 
    {    
        // monolog's Logger class
        // MAGENTO_ROOT/vendor/monolog/monolog/src/Monolog/Logger.php
        
        // saved in var/log/debug.log
        $this->_logger->debug('debug1234'); 
        //Output: [2017-02-22 04:48:44] main.DEBUG: debug1234 {"is_exception":false} []
        
        $this->_logger->info('info1234'); 
        // Write to default log file: var/log/system.log
        //Output: [2017-02-22 04:52:56] main.INFO: info1234 [] []
        
        $this->_logger->alert('alert1234'); 
        // Write to default log file: var/log/system.log
        //Output: [2017-02-22 04:52:56] main.ALERT: alert1234 [] []
        
        $this->_logger->notice('notice1234'); 
        // Write to default log file: var/log/system.log
        //Output: [2017-02-22 04:52:56] main.NOTICE: notice1234 [] []
        
        // Write to default log file: var/log/system.log
        $this->_logger->error('error1234'); 
        //Output: [2017-02-22 04:52:56] main.ERROR: error1234 [] []
        
         // Write to default log file: var/log/system.log
        $this->_logger->critical('critical1234'); 
        //Output: [2017-02-22 04:52:56] main.CRITICAL: critical1234 [] []
        
        // Adds a log record at an arbitrary level
        $level = 'DEBUG';
        // saved in var/log/debug.log
        $this->_logger->log($level,'debuglog1234', array('msg'=>'123', 'new' => '456')); 
        //Output: [2017-02-22 04:52:56] main.DEBUG: debuglog1234 {"msg":"123","new":"456","is_exception":false} []
        
        // Write to default log file: var/log/system.log
        $level = 'ERROR';
        $this->_logger->log($level,'errorlog1234', array( array('test1'=>'123', 'test2' => '456'), array('a'=>'b') )); 
        //Output: [2017-02-22 04:52:56] main.ERROR: errorlog1234 [{"test1":"123","test2":"456"},{"a":"b"}] []        
        
    }
    
}
?>