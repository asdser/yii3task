<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
//        'mail' => [
//         'class' => 'yii\swiftmailer\Mailer',
//         'transport' => [
//             'class' => 'Swift_SmtpTransport',
//             'host' => 'smtp.gmail.com',  // e.g. smtp.mandrillapp.com or smtp.gmail.com
//             'username' => 'task3asd@gmail.com',
//             'password' => 'asd3task',
//             'port' => '587', // Port 25 is a very common port too
//             'encryption' => 'tls', // It is often used, check your provider or mail server specs
//         ],
//     ],
    ],
    'params' => $params,
];
