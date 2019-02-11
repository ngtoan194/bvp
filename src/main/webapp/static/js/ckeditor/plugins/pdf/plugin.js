var CKEditorPlugin =
    {
        selectFile: function (data) {
            if (data.success) {
                var tmp = data.data[0].ImageUrl;
                ckeditor.insertHtml("<img  src='" + tmp + "' style='max-width: 100%;'/>");
            }
        }
    }

function isPdfFile(fileName) {
    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    if (ext == "pdf" || ext == "PDF") {
        return true;
    } else {
        alert("Vui lòng chọn file pdf");
        return false;
    }
    return true;
}

function upload(fileData, callBack, error) {
    var oMyForm = new FormData();
    oMyForm.append("file", fileData);
    $.ajax({
        dataType: 'json',
        enctype: 'multipart/form-data',
        type: 'POST',
        url: "/file/uploadFile",
        data: oMyForm,
        processData: false,  // tell jQuery not to process the data
        contentType: false,  // tell jQuery not to set contentType
        success: function (data) {
            callBack(data);
        },
        error: function (data) {
            error(data);
        }
    });
}

CKEDITOR.plugins.add('pdf', {
    icons: 'pdf',
    init: function (editor) {
        CKEDITOR.dialog.add('pdfDialog', function (editor) {
            return {
                title: 'Thêm file pdf',
                minWidth: 400,
                minHeight: 100,
                contents: [
                    {
                        id: 'tab-basic',
                        elements: [
                            {
                                type: 'file',
                                id: 'file',
                                validate: CKEDITOR.dialog.validate.notEmpty("Vui lòng chọn file pdf"),
                                onChange: function (event) {
                                    var filename = this.getValue();
                                    var isValid = false;
                                    if (filename == '') {
                                        isValid = false;
                                    } else if (isPdfFile(filename)) {
                                        isValid = true;
                                    } else {
                                        isValid = false;
                                        this.setValue('');
                                    }
                                    return isValid;
                                }
                            }
                        ]
                    }
                ],
                onOk: function () {
                    var dialog = this;

                    var file = dialog.getContentElement("tab-basic", "file").getInputElement().$.files[0];
                    upload(file, function (s) {
                        if (s && s.success && s.data.file) {
                            var abbr = editor.document.createElement('iframe');
                            // abbr.setAttribute('src', server_url + "file/view/" + s.data.file);
                            abbr.setAttribute('src', server_url + s.data.file);
                            abbr.setAttribute('width', "100%");
                            abbr.setAttribute('height', "500px");
                            editor.insertElement(abbr);
                        }

                    }, function (e) {
                        debugger;

                    })

                }
            };
        });

        editor.addCommand('insertPdf', new CKEDITOR.dialogCommand('pdfDialog'));
        editor.ui.addButton('pdf', {
            label: 'Upload hình ảnh',
            command: 'insertPdf',
            toolbar: 'insert'
        });
    }
});