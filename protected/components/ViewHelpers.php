<?php
/**
 * VewHelpers contains static functions to help to generate some HTML.
 */
class ViewHelpers
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/column1';

    public static function YesNo($value, $equal_to, $yes_text, $no_text)
    {
        return ($value == $equal_to) ? $yes_text : $no_text;
    }

    public static function valueToText($value, $params)
    {
        return isset($params[$value]) ? strval($params[$value]) : strval($value);
    }

}