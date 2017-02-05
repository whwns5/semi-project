/**
 * 
 */
function fileSelected() {
   var file = document.getElementById('review_img_file').files[0];
        if (file) {
          var fileSize = 0;
          if (file.size > 1024 * 1024){
        	  fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
          } else {
        	  fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
          }
            
          var infoHtml = '';
          infoHtml += '<span>파일명:</span>';
          infoHtml += file.name + ' ';
          infoHtml += '<span>파일용량:</span>';
          infoHtml += fileSize + ' ';
          infoHtml += '<span>파일형식:</span>';
          infoHtml += file.type;
          document.getElementById('fileSelected_info').innerHTML = infoHtml;
        }
      }
