<?php
class DbTest extends CTestCase
{
    public function testConnection()
    {
        //$this->assertTrue(true);
        $this->assertNotNull(Yii::app()->db->connectionString);
    }
}
