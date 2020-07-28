<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
  	<!-- Modal -->
	<div class="modal fade" id="comModal" tabindex="-1" role="dialog" aria-labelledby="common modal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title text-white" id="comModalTitle">-</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="comModalBody">&nbsp;</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="comModalBtn1" hidden>Save changes</button>
	        <button type="button" class="btn btn-dark" data-dismiss="modal" id="comModalBtnClose">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--  
	<div id="loadingModal" tabindex="-2" role="dialog" class="justify-content-center">
	<div class="justify-content-center spinner-border" id="loadingModal" tabindex="-2" role="dialog" aria-labelledby="loading modal" aria-hidden="true"></div>
	-->
	<!--  
	<div class="modal fade" id="loadingModal" tabindex="-2" role="dialog" aria-labelledby="loading modal" aria-hidden="true"></div>
	  <div class="spinner-border" role="status">
	    <span class="sr-only">Loading...</span>
	  </div>
	</div>
	-->
	
	<!--  
	https://stackoverflow.com/questions/48228724/centered-modal-load-spinner-bootstrap-4/48228917
	-->
	<div id="loadingModal" class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" tabindex="-1">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content bg-transparent" style="width: 48px">
	            <span class="fa fa-spinner fa-spin fa-3x text-primary"></span>
	        </div>
	    </div>
	</div>
		
	<script>

		// Add hide event in the loading modal div. 
		window.addEventListener("load", function(evt) {
			$('#loadingModal').on('shown.bs.modal', function (e) {
				if( !IS_LOADING ) {
					$('#loadingModal').modal('hide');
				}
			});
		});
		
		// Loading layer
		// options : 	true 	= Show loading layer.
		// 				false 	= Hide loading layer.
		function loading( option ) {
			//let classWatcher = new ClassWatcher(targetNode, 'trigger', alert(1), alert(2) );
			
			if( option ) {

				/*$('#loadingModal').on('classChange', function() {
				     console.log( "aaa" );
				});
				*/
				IS_LOADING = true;
				$('#loadingModal').on('shown.bs.modal', function (e) {
					console.log( "aaa" );
					
				});	
				
				$('#loadingModal').modal("show");
			} else {
				IS_LOADING = false;
				$('#loadingModal').modal('hide');
				/*$('#loadingModal').show().on('shown', function() { 
				    $('#loadingModal').modal('hide') 
				});*/
				//console.log( $('#loadingModal').is(':visible') );
				//console.log( $('#loadingModal').hasClass('show') );
				//$('#loadingModal').modal("hide");

				/*$('#loadingModal').on( "onclick", function( e ) {
						alert( "aaa" );
				} );*/

				/*$('#loadingModal').addEventListener("visibilitychange", function() {
					  console.log( document.visibilityState );
				});
				*/

				
				
				
			}
		}
		
		// 알림용 모달창 표시
		// https://getbootstrap.com/docs/4.0/components/modal/
		// type : info, warning
		// type, msg, closeCallbackFnc, btn1CallbackFnc
		function showComModal( options ) {

			// Case of confirming modal
			if( options.type != undefined && options.type == "save" ) {	// // Ask confirm to save
				document.querySelector( ".modal-header" ).style.backgroundColor = "#17A2B8";	// info color
				document.querySelector( "#comModalTitle" ).textContent = "확인";
				
				document.querySelector( "#comModalBtn1" 	).hidden 		= false;
				document.querySelector( "#comModalBtn1" 	).textContent 	= "저장";
				document.querySelector( "#comModalBtnClose" ).textContent 	= "취소";

				// Click btn1
				document.querySelector( "#comModalBtn1" 	).addEventListener( "click", function( evt ) {
					$('#comModal').modal("hide");
					if( options.btn1CallbackFnc ) {
						options.btn1CallbackFnc();
					}
				} );
				
			} else {	// Case of normal alarming modal
				document.querySelector( "#comModalBtn1" 	).hidden 		= true;
				document.querySelector( "#comModalBtnClose" ).textContent 	= "닫기";
			
				if( options.type == undefined || options.type == "info" ) {
					document.querySelector( ".modal-header" ).style.backgroundColor = "#428bca";	// primary color
					document.querySelector( "#comModalTitle" ).textContent = "알림";
				} else if( options.type != undefined && options.type == "warning" ) {
					document.querySelector( ".modal-header" ).style.backgroundColor = "#f0ad4e";	// warning color
					document.querySelector( "#comModalTitle" ).textContent = "경고";
				} else if( options.type != undefined && options.type == "error" ) {
					document.querySelector( ".modal-header" ).style.backgroundColor = "#d9534f";	// danger color
					document.querySelector( "#comModalTitle" ).textContent = "오류";
				}
				
			} 
			
			//document.querySelector( "#comModalBody"  ).textContent = options.msg; // 줄 바꿈 처리가 안되어 innerHTML로 변경
			document.querySelector( "#comModalBody"  ).innerHTML = options.msg;
			
			$('#comModal').modal("show");
			
			// 닫기 시 콜백 함수가 있으면 실행
			$('#comModal').on('hidden.bs.modal', function (e) {
				if( options.closeCallbackFnc ) {
					options.closeCallbackFnc();
				}
				
			});			
		}
		
	</script>