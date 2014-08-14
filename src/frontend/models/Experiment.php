<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "experiment".
 *
 * @property integer $id_exp
 * @property string $date
 * @property string $time
 * @property string $name
 * @property integer $bones_num
 * @property integer $throws
 *
 * @property Results[] $results
 */
class Experiment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'experiment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'throws'], 'required'],
            [['bones_num', 'throws'], 'integer'],
            [['date', 'time', 'name'], 'string', 'max' => 30]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_exp' => 'Id Exp',
            'date' => 'Date',
            'time' => 'Time',
            'name' => 'Name',
            'bones_num' => 'Bones Num',
            'throws' => 'Throws',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getResults()
    {
        return $this->hasMany(Results::className(), ['id_exp' => 'id_exp']);
    }
    
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            date_default_timezone_set('Europe/Kiev');
            
            $this->date = date("d.m.y");
            $this->time = date("H:i:s");
            $this->bones_num = 2;

            return true;
        } else {
            return false;
        }
    }
    public function afterSave($insert, $changedAttributes) {
        $connection = \Yii::$app->db;
        
        $number = $this->throws;
        for ($i = 0; $i < $number; $i++) {
            $arr[$i] = rand(1, 6) + rand(1, 6);
        }
        $index = Experiment::find()-> max('id_exp');
        $arr2 = array_count_values($arr);
        ksort($arr2);

        foreach ($arr2 as $key => $value) {
            $connection->createCommand()->batchInsert('bones.results', ['num', 'count', 'id_exp'], [
                [$key, $value, $index],
            ])->execute();
        }
    }
}
