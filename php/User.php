<?php



require 'connect.php';
require 'Utils.php';

class User{

    private $db;
    private $userId = 0;

    public function __construct($id)
    {
        $this->db = DbConnect::connect();
        $this->userId = $id;
    }


    /**
     * @return array
     */
    public function getUserData()
    {
        return $this->db->fetch("select * from users WHERE id = '$this->userId' limit 1");
    }

    /**
     * @return array
     */
    public function getUserPlans()
    {
        return $this->db->fetch("select * from signups WHERE user_id = '$this->userId'");
    }

    /**
     * @return array
     */
    public function signUpForPlan($title, $plan) // order for payment in question  is not correct
    {
        $user = $this->getUserData()[0];
        $signupId = $this->db->insertData('signups',    // should come after payment..
                "signup_title, user_id, internet_plan_id",
                "'$title', '$this->userId', '$plan'"
        );

        if(Utils::pay($this->userId, $plan, $user['balance'], $signupId)){
            echo "payment successful";
            return true;
        }

        echo "payment un-successful";
        return false;

    }


}


if (isset($_GET['action']) && $_GET['action'] == 'signup_plan'){
     $user = new User($_GET['userid']);
     $plan = Utils::getPlanAndProvider($_GET['planid']);
     if ($user->getUserData()[0]['balance'] >= $plan['price']){
         $user->signUpForPlan($plan['title'], $plan['planid']);
     }else{
         echo "Not enough balance";
     }

}

if (isset($_GET['userid']) && isset($_GET['info']) && $_GET['info'] == 'plans'){
    $user = new User($_GET['userid']);
    echo  json_encode($user->getUserPlans());
}


if (isset($_GET['info']) && $_GET['info'] == 'userdata'){
    $user = new User($_GET['userid']);
    $user->getUserData();
}







?>
