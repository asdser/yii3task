<?php
namespace frontend\models;

use common\models\User;
use yii\base\Model;
use Yii;


/**
 * Signup form
 */
class RegistrationForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $verifyCode;
    public $confirmPassword;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],
            
            ['confirmPassword', 'required'],
            ['confirmPassword', 'string', 'min' => 6],
            
            
            ['verifyCode', 'captcha'],
            
            ['confirmPassword', 'compare', 'compareAttribute' => 'password'],
        
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function registration()
    {
        if ($this->validate()) {
            $user = new User();
            $user->username = $this->username;
            $user->email = $this->email;
            $user->setPassword($this->password);
            $user->generateAuthKey();
            $user->save();
            $user->pass = $this->password;
            return $user;
        }

        return null;
    }
    
   
}
