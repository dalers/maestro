var authItemTypeName = new Array('operation','task','role');

/** Open dlgCreateAuthItem dialog for creation
 * @param type integer Autorization item type (0=Operation,1=Task,2=Role)
 */
function openDialogCreate(type) {
	$("#dlgCreateAuthItem").dialog('option', 'title', CREATE+AuthItemTypeName[type]);
	$('#AuthItemForm_type').val(type);
	$('#AuthItemForm_oldname').val('');
	$('#AuthItemForm_name').val('');
	$('#AuthItemForm_description').val('');
	$('#AuthItemForm_bizRule').val('');
	$('#AuthItemForm_data').val('');
	settings = $('#authorization-item-form').data('settings');
	$.each(settings.attributes, function () {
		$.fn.yiiactiveform.updateInput(this, null, $('#authorization-item-form'));
	});
	$("#dlgCreateAuthItem").dialog('open');
}

/** Open dlgCreateAuthItem dialog for change
 * @param integer type Autorization item type (0=Operation,1=Task,2=Role)
 * @param string url
 */
function openDialogChange(type,url) {
	var item = $('#'+authItemTypeName[type]+' option:selected').val();
	var request = {'item':item};
	$("#dlgCreateAuthItem").dialog('option', 'title', CHANGE+AuthItemTypeName[type]);
	$('#AuthItemForm_type').val(type);
	$('#AuthItemForm_name').val(item);
	$('#AuthItemForm_oldname').val(item);
	$.getJSON(url, request, function(data){
		$('#AuthItemForm_description').val(data.description);
		$('#AuthItemForm_bizRule').val(data.bizRule);
		$('#AuthItemForm_data').val(data.data);
	});
	settings = $('#authorization-item-form').data('settings');
	$.each(settings.attributes, function () {
		$.fn.yiiactiveform.updateInput(this, null, $('#authorization-item-form'));
	});
	$("#dlgCreateAuthItem").dialog('open');
}

/** */
function openDialogAttach(type1,type2,url) {
	var item = $('#'+authItemTypeName[type1]+' option:selected').val();
	var request = {'item':item, 'type':type2, 'action':'attach'};
	$('#AttachItemForm_attachname').load(url, request);
	$('#AttachItemForm_name').val(item);
	$('#AttachItemForm_action').val('attach');
	$("#dlgAttachAuthItem").dialog('option', 'title', ATTACH+AuthItemTypeName[type2]+TOTHE+AuthItemTypeName[type1]+' '+item);
	settings = $('#attach-item-form').data('settings');
	$.each(settings.attributes, function () {
		$.fn.yiiactiveform.updateInput(this, null, $('#attach-item-form'));
	});
	$("#dlgAttachAuthItem").dialog('open');
}

/** */
function openDialogDetach(type1,type2,url) {
	var item = $('#'+authItemTypeName[type1]+' option:selected').val();
	var request = {'item':item, 'type':type2, 'action':'detach'};
	$('#AttachItemForm_attachname').load(url, request);
	$('#AttachItemForm_name').val(item);
	$('#AttachItemForm_action').val('detach');
	$("#dlgAttachAuthItem").dialog('option', 'title', DETACH+authItemTypeName[type2]+FROMTHE+authItemTypeName[type1]+' '+item);
	settings = $('#attach-item-form').data('settings');
	$.each(settings.attributes, function () {
		$.fn.yiiactiveform.updateInput(this, null, $('#attach-item-form'));
	});
	$("#dlgAttachAuthItem").dialog('open');
}

/** */
function openDialogAssign(type,url) {
	var user = $('#user option:selected');
	if(user.length == 1) {
		name = user.text();
		$("#dlgAssignItem").dialog('option', 'title', ASSIGN+AuthItemTypeName[type]+ASSIGNTO+name);
	} else {
		$("#dlgAssignItem").dialog('option', 'title', ASSIGN+AuthItemTypeName[type]+ASSIGNTOMULTI);
	}
	$('#AssignItemForm_item').load(url, {type: type});
	$('#AssignItemForm_action').val('assign');
	$('#AssignItemForm_type').val(type);
	$("#dlgAssignItem").dialog('open');
}

/** */
function openDialogRevoke(type,url) {
	var user = $('#user option:selected');
	if(user.length == 1) {
		name = user.text();
		$("#dlgAssignItem").dialog('option', 'title', REVOKE+AuthItemTypeName[type]+REVOKEFROM+name);
	} else {
		$("#dlgAssignItem").dialog('option', 'title', REVOKE+AuthItemTypeName[type]+REVOKEFROMMULTI);
	}
	var users = new Array();
	user.each(function() { users.push(this.value); });
	$('#AssignItemForm_item').load(url, {type: type, users: users});
	$('#AssignItemForm_action').val('revoke');
	$('#AssignItemForm_type').val(type);
	$("#dlgAssignItem").dialog('open');
}

/** */
function deleteAuthItem(type,url) {
	var item = $('#'+authItemTypeName[type]+' option:selected').val();
	var request = {'item':item};
	if(confirm(CONFIRM+AuthItemTypeName[type]+' "'+item+'"?')) {
		$.post(url, request, function() {
			var index = $("#tabs").tabs("option","active");
			$("#tabs").tabs('load', index);
		});
	}
}

/** Save an authorization item */
function saveAuthItem(url) {
	var formdata = $('#authorization-item-form').serialize();
	$.ajax({
		url: url,
		type: "POST",
		dataType: "json",
		data: formdata,
		success: function(data){
			if(data.error == 'none') {
				$("#dlgCreateAuthItem").dialog('close');
				var index = $("#tabs").tabs("option","active");
				$("#tabs").tabs('load', index);
			} else {
				settings = $('#authorization-item-form').data('settings');
				$.each(settings.attributes, function () {
					$.fn.yiiactiveform.updateInput(this, data.error, $('#authorization-item-form'));
				});
			}
		},
		error: function(error){
			 console.log("Error:");
			 console.log(error);
		}
	});
}

/** Attach/detach an authorization item */
function attachAuthItem(url1, url2) {
	var formdata = $('#attach-item-form').serialize();
	$.ajax({
		url: url1,
		type: "POST",
		dataType: "json",
		data: formdata,
		success: function(data){
			if(data.error == 'none') {
				$('#'+authItemTypeName[data.type]+'-info').toggleClass('spinner');
				$("#dlgAttachAuthItem").dialog('close');
				$('#'+authItemTypeName[data.type]+'-info').load(url2, {'item':data.name}, function(){$('#'+authItemTypeName[data.type]+'-info').toggleClass('spinner')});
			} else {
				settings = $('#attach-item-form').data('settings');
				$.each(settings.attributes, function () {
					$.fn.yiiactiveform.updateInput(this, data.error, $('#attach-item-form'));
				});
			}
		},
		error: function(error){
			 console.log("Error:");
			 console.log(error);
		}
	});
}

/** Assign/Revoke authorization item(s) to/from user(s) */
function assignItem(url,url2) {
	var data = $('#user-select-form, #assign-item-form').serialize();
	$.ajax({
		url: url,
		type: "POST",
		dataType: "json",
		data: data,
		success: function(data){
			selectUser(url2);
			$("#dlgAssignItem").dialog('close');
		},
		error: function(error){
			 console.log("Error:");
			 console.log(error);
		}
	});
}

/** Display information on selection of authorization item
 * @param HtmlElement Object obj
 */
function selectAuthItem(obj,url) {
	var item = $('#'+obj.id+' option:selected').val();
	var request = {'item':item};
	$('#'+obj.id+'-info').toggleClass('spinner');
	$('#'+obj.id+'-info').html('');
	$('#'+obj.id+'-info').load(url, request, function(){$('#'+obj.id+'-info').toggleClass('spinner')});
	$('input[type=button]').attr('disabled', false);
}

/** Display information on selection of user
 * @param HtmlElement Object obj
 */
function selectUser(url) {
	var user = $('#user option:selected');
	if(user.length == 1) {
		name = user.text();
		user = user.val();
		$('#user-info').toggleClass('spinner');
		$('#user-info').html('');
		$('#user-info').load(url, {user: user,name: name}, function(){$('#user-info').toggleClass('spinner')});
	} else {
		$('#user-info').text(MULTIPLE);
	}
	$('input[type=button]').attr('disabled', false);
}

/** Function called by the tab loaded event
 * @param HtmlElement Object obj
 */
function tabLoaded(obj,url1,url2) {
	if(obj.id == 'tab1') {
		if($("#tempuser").text() != "") {
			user = $("#tempuser").text();
			$("#tempuser").text("");
			$("#user").val(user);
			name = $("#user option:selected").text();
			$('#user-info').toggleClass('spinner');
			$('#user-info').load(url2, {user: user, name: name}, function(){$('#user-info').toggleClass('spinner')});
			$('input[type=button]').attr('disabled', false);
		}
		$( "#search" ).autocomplete({
			source: url1,
			minLength: 2,
			delay: 200,
			select: function( event, ui ) { 
				$( "#search" ).val( ui.item.label );
				$( "#user" ).val( ui.item.value );
				$('#user-info').toggleClass('spinner');
				$('#user-info').html('');
				$('#user-info').load(url2, {user: ui.item.value,name: ui.item.label}, function(){$('#user-info').toggleClass('spinner')});
				$('input[type=button]').attr('disabled', false);
				return false;
			}
		});
	}
}

/** Function to select Assignment tab and select user
 * @param integer user
 */
function selectUserTab(user) {
	$("#tempuser").text(user);
//	$('#tabs').tabs('select', 0);           // jQuery UI < 1.9
	$("#tabs").tabs("option", "active", 0); // jQuery UI >= 1.9
}