<!doctype html>
<html lang="<?= LANGUAGE_ID; ?>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php $APPLICATION->ShowTitle(); ?></title>

    <?php \Bitrix\Main\Page\Asset::getInstance()->addCss(ASSETS_PATH . '/css/main.css') ?>


    <?php $APPLICATION->ShowHead(); ?>
</head>
<body>
<?php $APPLICATION->ShowPanel(); ?>
<div class="main-wrapper">

    <?php require_once('include/parts/header.php'); ?>
    <?php //$APPLICATION->IncludeFile('include/parts/header.php'); ?>
    <div class="main-content">
        <div class="container">
            <?php $APPLICATION->IncludeComponent("bitrix:breadcrumb", "main", Array(), false); ?>

            <?php if (canShowTitle()): ?>
                <h1 class="site-title"><?php $APPLICATION->ShowTitle(); ?></h1>
            <?php endif; ?>
