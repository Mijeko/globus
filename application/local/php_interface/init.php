<?php

if (!defined('ASSETS_PATH')) {
    define('ASSETS_PATH', '/local/assets');
}
if (!defined('IBLOCK_ID_MENU_SCHOOL')) {
    define('IBLOCK_ID_MENU_SCHOOL', 6);
}

function canShowFooterContacts()
{
    global $APPLICATION;
    if ($APPLICATION->GetCurDir() == '/') {
        return true;
    }

    return false;
}

function canShowTitle()
{
    global $APPLICATION;
    if ($APPLICATION->GetCurDir() == '/') {
        return false;
    }

    return true;
}