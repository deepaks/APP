var swfu;
function initUploader(url) {
	settings = {
		flash_url : "/javascripts/swfupload/swfupload.swf",
		upload_url: url,
		// post_params : '',
		file_size_limit : "100 MB",
		file_types : "*.*",
		file_types_description : "All Files",
		file_upload_limit : 100,
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress",
			cancelButtonId : "btnCancel"
		},
		debug: false,

		// Button settings
		button_image_url: "/",
		button_width: "80",
		button_height: "20",
		button_placeholder_id: "spanButtonPlaceHolder",
		button_text: '<span class="browse">Choose File</span>',
		button_text_style: ".browse { font-size: 12px; padding:10px;border:1px solid #999; background:#EEE; font-family:Arial, Helvetica;}",
		button_text_left_padding: 0,
		button_text_top_padding: 7,

		// The event handler functions are defined in handlers.js
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete	// Queue plugin event
	};

	swfu = new SWFUpload(settings);
};
