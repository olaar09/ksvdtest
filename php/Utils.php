<?php

require 'connect.php';
if (!class_exists('Utils')) {
    class Utils
    {
        public static function getPlanAndProvider($planId)
        {
            $sql = "select ipl.id as planid, ipl.title, ipl.provider, ipl.price, ipl.description, ipr.* from internet_plans as ipl  JOIN internet_providers as ipr ON ipl.provider = ipr.id WHERE ipl.id = " . $planId. " LIMIT 1";
            return DbConnect::connect($sql)->fetch($sql)[0];
        }


        public static function pay($userId, $planId, $currUserBalance, $signupId)
        {
            $db = DbConnect::connect();
            $plan = self::getPlanAndProvider($planId);

            if ($currUserBalance >= $plan['price']) {
                // reduce user balance
                $sql = "update users Set balance = " . ($currUserBalance - $plan['price']) . " WHERE id = " . $userId;
                $db->updateOrDel($sql);

                //increase provider balance
                $sql = "update internet_providers Set balance = " . ($plan['balance'] + $plan['price']) . " WHERE id = " . $plan['provider'];
                $db->updateOrDel($sql);

                //add entry to payment table
                $db->insertData('payments', 'signup_id, attempts, success', "'$signupId', 1, 1");
                return true;
            }

            return false;
        }

        public static function getInternetPlans()
        {
            $sql = "select ipl.id as planid, ipl.title, ipl.provider, ipl.price, ipl.description, ipr.*  from internet_plans as ipl JOIN internet_providers as ipr  ON ipl.provider = ipr.id";
            return DbConnect::connect()->fetch($sql);

        }

        public static function getInternetProviders()
        {
            return DbConnect::connect()->fetch("select * from internet_providers");
        }

    }

}


if (isset($_GET['planid']) && isset($_GET['info']) &&  $_GET['info'] == 'plan'){
    echo  json_encode(Utils::getPlanAndProvider($_GET['planid']));
}

if (isset($_GET['info']) && $_GET['info'] == 'allplans'){
    echo json_encode(Utils::getInternetPlans());
}
?>
