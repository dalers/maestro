<?php

// Provides code completion in NetBeans for "Yii::app()->user<CTRL+SPACE>"
// http://www.yiiframework.com/wiki/453/phpstorm-netbeans-autocomplete-problem
 
class Yii extends YiiBase
{
    /**
     * Returns the application singleton or null if the singleton has not been created yet.
     * @return CWebApplication the application singleton, null if the singleton has not been created yet.
     */
    public static function app()
    {
        return self::app();
    }
}
