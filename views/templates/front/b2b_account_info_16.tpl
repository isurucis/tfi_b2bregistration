{**
* 2007-2023 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2023 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{include file="$tpl_dir./errors.tpl"}
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
{capture name=path}{l s='My account' mod='b2bregistration'}{/capture}
	{if $enable_captcha }
	    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
	{/if}
	
	<section class="register-form">
        <form id="customer-form" method="post" action="{$url_link|escape:'htmlall':'UTF-8'}">
			<input type="hidden" name="id_profile" value="{$id_profile|intval}">
			<section>
				<input type="hidden" name="id_b2b" value="{if !empty($b2b_data.id_b2bregistration)}{$b2b_data.id_b2bregistration|escape:'htmlall':'UTF-8'}{/if}">
				<h3>{l s='B2B Information' mod='b2bregistration'}</h3><hr>
				<div class="form-group col-md-3">
				    <label for="first-name">{l s='First Name' mod='b2bregistration'}<sup style="color:red;" class="required">*</sup></label>
			    	<input type="text" name="first_name" id="first-name" class="form-control" value="{if !empty($b2b_data.firstname)}{$b2b_data.firstname|escape:'htmlall':'UTF-8'}{/if}">
			    </div>
			    {if $middle_name}
				 	<div class="form-group col-md-3">
					    <label for="middle-name">{l s='Middle Name' mod='b2bregistration'}</label>
				    	<input type="text" name="middle_name" id="middle-name" class="form-control" value="{if !empty($b2b_data.middle_name)}{$b2b_data.middle_name|escape:'htmlall':'UTF-8'}{/if}">
				    </div>
				{/if}
			    <div class="form-group col-md-3">
				    <label for="last-name">{l s='Last Name' mod='b2bregistration'}<sup style="color:red;" class="required">*</sup></label>
			    	<input type="text"  name="last_name" id="last-name" class="form-control" value="{if !empty($b2b_data.lastname)}{$b2b_data.lastname|escape:'htmlall':'UTF-8'}{/if}">
			    </div>
			    {if $enable_suffix}
					<div class="form-group col-md-3">
				      <label for="name-suffix">{l s='Name Suffix' mod='b2bregistration'}</label>
				    	<select class="form-control" id="name-suffix" name="name_suffix">
			         		{if !empty($name_suffix)}
			         			{foreach from=$name_suffix item=name_suffixes}
			         				<option value="{if !empty($name_suffixes)}{$name_suffixes|escape:'htmlall':'UTF-8'}{/if}" {if !empty($b2b_data.name_suffix) AND $b2b_data.name_suffix == $name_suffixes}selected{/if}>{$name_suffixes|escape:'htmlall':'UTF-8'}</option>
			         			{/foreach}
			         		{/if}
			         	</select>
				    </div>	
				{/if}

			    {if $enable_website}
					<div class="form-group col-md-3">
				     	<label for="gender">{l s='Website' mod='b2bregistration'}<sup style="color:red;" class="required">*</sup></label>
				    	<input type="text" name="website" id="company-website" class="form-control" value="{if !empty($b2b_data.website)}{$b2b_data.website|escape:'htmlall':'UTF-8'}{/if}" placeholder="{l s='https://www.google.com' mod='b2bregistration'}">
				    </div>	
				{/if}

			    <div class="form-group col-md-3">
				    <label for="company-name">{l s='Company Name' mod='b2bregistration'}<sup style="color:red;" class="required">*</sup></label>
			    	<input type="text" name="company_name" id="company-name" class="form-control" value="{if !empty($b2b_data.company)}{$b2b_data.company|escape:'htmlall':'UTF-8'}{/if}" >
			    </div>

				{if $enable_identification_number}
				    <div class="form-group col-md-3">
					    <label for="identification-number">{l s='Identification/Siret Number' mod='b2bregistration'}<sup style="color:red;" class="required">*</sup></label>
				    	<input type="text" name="identification_number" id="identification-number" class="form-control" value="{if !empty($b2b_data.siret)}{$siret|escape:'htmlall':'UTF-8'}{/if}">
				    </div>
				{/if}

			    <div class="form-group col-md-3">
				    <label for="email">{l s='Email' mod='b2bregistration'}<sup style="color:red;" class="required">*</sup></label>
			    	<input type="email" name="email" id="email" class="form-control" value="{if !empty($b2b_data.email)}{$b2b_data.email|escape:'htmlall':'UTF-8'}{/if}">
			    </div>
				{if $enable_group_selection}
					{if !empty($selected_groups)}
						<div class="form-group col-md-3">
						<label for="select-group">{l s='Select group' mod='b2bregistration'}</label>
							<select class="form-control" id="select-group" name="customer_group">
								{if !empty($all_groups)}
									{foreach from=$all_groups item=groups}
										{if in_array($groups['id_group'], $selected_groups)}
											<option value="{$groups['id_group']}"{if $default_group AND $default_group == $groups['id_group']}selected{/if}>{$groups['name']|escape:'htmlall':'UTF-8'}</option>
										{/if}
									{/foreach}
								{/if}
							</select>
						</div>
					{/if}
				{/if}
				{if !empty($custom_fields) AND $enable_custom}
					{foreach from=$fields_custom item=fields}
						<div class="form-group col-md-3">
							<input type="hidden" name="id_fields[]" value="{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}">
							<input type="hidden" name="label_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}" value="{if !empty($fields.b2b_field_title)}{$fields.b2b_field_title|escape:'htmlall':'UTF-8'} {/if}">
							{if $fields.b2b_field_type == 'text'}
								<label for="field_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}">{if $fields.field_required}<sup style="color:red;" class="required">*</sup>{/if}{$fields.b2b_field_title|escape:'htmlall':'UTF-8'}</label>
								<input type="text" name="field_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}" value="{if !empty($fields.b2b_field_name)}{$fields.b2b_field_name|escape:'htmlall':'UTF-8'} {/if}" id="field_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}" class="form-control" {if $fields.field_required}required="required"{/if}>	
							{else}
								<label for="field_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}">{if $fields.field_required}<sup style="color:red;" class="required">*</sup>{/if}{$fields.b2b_field_title|escape:'htmlall':'UTF-8'}</label>
								<textarea name="field_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}" class="form-control" {if $fields.field_required}required=""{/if} id="field_{$fields.id_b2b_custom_fields|escape:'htmlall':'UTF-8'}">{if !empty($fields.b2b_field_title)}{$fields.b2b_field_name|escape:'htmlall':'UTF-8'}{/if}</textarea>
							{/if}
						</div>
					{/foreach}
					<div class="form-group row"></div>
				{/if}
    			<div class="form-group col-md-4" >
		          <span class="custom-checkbox" style="display: block ruby;">
		            <label class="label-control col-md-12" style="display: block ruby">
		              	<input name="terms" type="checkbox" id="terms" value="1" >
		              	<span style="display: ruby;">
		              		{l s='I agree to the terms and conditions and the privacy policy' mod='b2bregistration'}
		              	</span>
		              
						{if isset($cms) AND $cms}
							<a class="read-b2b-conditions" href="#b2b-cond" class="thickbox" title="{l s='Conditions of the B2B registration program' mod='b2bregistration'}" rel="nofollow">{l s='Read conditions.' mod='b2bregistration'}</a>
							<div style="display:none;">
								<div id="b2b-cond">
									{include file="$tpl_dir./cms.tpl"}
								</div>
							</div>
						{/if}
					</label>
		          </span>
    			</div>
				
    			<!-- consent box -->
				<div class="form-group row">
					<div class="col-lg-9">
						{hook h='displayGDPRConsent' mod='psgdpr' id_module=$id_module}
					</div>
				</div>
    			<div class="form-group col-md-12">
                	<div class='g-recaptcha' id='Gcaptcha'></div>
    			</div>
    			<div class="col-md-12"></div>
    			<footer class="form-footer clearfix">
    				 <button title="{l s='Check terms to enable button' mod='b2bregistration' }" class="btn btn-primary form-control-submit float-xs-right" type="submit" id="b2b_data" name="b2b_data" {if isset($site_key) AND $enable_captcha}style='display:none;'{/if}>
			          {l s='Save' mod='b2bregistration'}
			        </button>
    			</footer>
			</section>		
		</form>
	</section>