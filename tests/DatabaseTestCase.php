// tests/DatabaseTestCase.php
<?php

use PHPUnit\Framework\TestCase;

abstract class DatabaseTestCase extends TestCase
{
    protected $mysqli;

    protected function setUp(): void
    {
        $this->mysqli = new mysqli('localhost', 'root', '123456789', 'appsalon_mvc');

        if ($this->mysqli->connect_error) {
            die('Connect Error (' . $this->mysqli->connect_errno . ') ' . $this->mysqli->connect_error);
        }

        Model\ActiveRecord::setDB($this->mysqli);

        $this->beginTransaction();
    }

    protected function tearDown(): void
    {
        $this->rollbackTransaction();
        $this->mysqli->close();
    }

    private function beginTransaction()
    {
        $this->mysqli->begin_transaction();
    }

    private function rollbackTransaction()
    {
        $this->mysqli->rollback();
    }
}
