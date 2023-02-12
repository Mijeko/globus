<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('Закупки'); ?>
<?php
$APPLICATION->IncludeComponent(
	"bitrix:catalog.section.list", 
	"menu-school", 
	array(
		"COMPONENT_TEMPLATE" => "menu-school",
		"IBLOCK_TYPE" => "documents",
		"IBLOCK_ID" => "9",
		"SECTION_ID" => $_REQUEST["SECTION_ID"],
		"SECTION_CODE" => "",
		"COUNT_ELEMENTS" => "Y",
		"COUNT_ELEMENTS_FILTER" => "CNT_ACTIVE",
		"TOP_DEPTH" => "2",
		"SECTION_FIELDS" => array(
			0 => "",
			1 => "",
		),
		"SECTION_USER_FIELDS" => array(
			0 => "",
			1 => "",
		),
		"FILTER_NAME" => "sectionsFilter",
		"VIEW_MODE" => "LINE",
		"SHOW_PARENT_NAME" => "Y",
		"SECTION_URL" => "",
		"CACHE_TYPE" => "A",
		"CACHE_TIME" => "36000000",
		"CACHE_GROUPS" => "Y",
		"CACHE_FILTER" => "N",
		"ADD_SECTIONS_CHAIN" => "N"
	),
	false
);
?>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>