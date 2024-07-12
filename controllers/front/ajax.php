<?php
/**
 *
 * NOTICE OF LICENSE
 *
 * You are not authorized to modify, copy or redistribute this file.
 * Permissions are reserved by FME Modules.
 *
 *  @author    FME Modules
 *  @copyright 2020 fmemodules All right reserved
 *  @license   FMM Modules
 */

class B2bregistrationAjaxModuleFrontController extends ModuleFrontController
{
    public $ajax = false;
    public function __construct()
    {
        parent::__construct();
        $this->context = Context::getContext();
        $this->ajax = Tools::getValue('ajax');
    }

    public function init()
    {
        parent::init();
        if (!($this->context->customer->logged) && !$this->ajax) {
            Tools::redirect($this->context->link->getPageLink('my-account'));
        }
    }

    public function initContent()
    {
        parent::initContent();
        if (Tools::getValue('action') && Tools::getValue('action') == 'download') {
            $id_file = base64_decode(Tools::getValue('field'));
            $id_customer = base64_decode(Tools::getValue('me'));
            if ($id_file && $id_customer) {
                b2bCustomFields::downloadAttachment($id_file, $id_customer);
            } else {
                return false;
            }
        }
    }

    public function displayAjaxCheckFields()
    {
        $response = [
            'hasError' => false,
            'errors' => '',
            'reference' => 'ajaxFields',
        ];
        $id_customer = (isset(
            $this->context->customer->id
        )) ? $this->context->customer->id : (isset(
            $this->context->cookie->id_customer
        ) ? $this->context->cookie->id_customer : $this->context->cookie->id_guest);
        $type = (isset(
            $this->context->customer->id
        )) ? 'customer' : (isset($this->context->cookie->id_customer) ? 'customer' : 'guest');
        if (false === $this->module->hookActionBeforeSubmitAccount()) {
            $this->context->smarty->assign('errors', $this->errors);
            $response['hasError'] = true;
            $response['errors'] = $this->context->smarty->fetch(
                _PS_MODULE_DIR_ . $this->module->name .
                '/views/templates/front/errors.tpl'
            );
        } else {
            $objModel = new BToBCustomFields();
            $objModel->saveFieldValues(
                Tools::getValue('fields'),
                $id_customer,
                null,
                $type
            );
        }
        exit(json_encode($response));
    }
}
