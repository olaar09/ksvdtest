<?php

if (!class_exists('DbConnect')) {
    class DbConnect
    {
        const HOSTNAME = "127.0.0.1";
        const DB_USER = "root";
        const DB_PASS = "";
        const DB = "developer_test";
        const ERR_DB_NOT_SET = "db not set";

        private $connect = null;

        public function __construct()
        { // throws PDO EXCEPTION..
            try {
                $this->connect = new PDO("mysql:host=" . self::HOSTNAME . ";dbname=" . self::DB, self::DB_USER, self::DB_PASS);
                $this->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $this->connect;
            } catch (PDOException $e) {
                echo "Error while connecting to db -->" . $e->getMessage();
                return false;
            }
        }

        public static function connect()
        {
            return new DbConnect();
        }


        public function insertData($table, $columns, $values)
        {
            if ($this->connect == null) {
                throw new Exception(self::ERR_DB_NOT_SET);
            }

            try {
                $sql = "INSERT INTO $table ($columns) VALUES ($values)";

                $this->connect->exec($sql);
                return $this->connect->lastInsertId();
            } catch (PDOException $e) {
                throw new Exception("An error occured while trying to inster into the db : " . $e->getMessage());
            }

            return 0;
        }


        public function fetch($sql)
        { // always return array of results even for single result
            if ($this->connect == null) {
                throw new Exception(self::ERR_DB_NOT_SET);
            }

            try {
                $stmt = $this->connect->prepare($sql);
                $stmt->execute();
                $result = [];

                // set the resulting array to associative
                $stmt->setFetchMode(PDO::FETCH_ASSOC);
                foreach ($stmt->fetchAll() as $v) {
                    $result[] = $v;
                }
                return $result;
            } catch (PDOException $e) {
                throw new Exception("An error occured while trying to fetch data from the db : " . $e->getMessage());
            }

            return false;
        }


        public function updateOrDel($sql)
        { // return bool
            if ($this->connect == null) {
                throw new Exception(self::ERR_DB_NOT_SET);
            }

            try {
                $stmt = $this->connect->prepare($sql);
                $stmt->execute();
                return true;
            } catch (PDOException $e) {
                throw new Exception("An error occured  : " . $e->getMessage());
            }

            return false;
        }

    }
}
?>
