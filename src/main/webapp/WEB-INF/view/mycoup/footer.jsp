<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!--Footer-->
  <footer class="page-footer text-center font-small mt-4 wow fadeIn">

    <!--Call to action
    <div class="pt-4">
      <a class="btn btn-outline-white" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank"
        role="button">Download MDB
        <i class="fas fa-download ml-2"></i>
      </a>
      <a class="btn btn-outline-white" href="https://mdbootstrap.com/education/bootstrap/" target="_blank" role="button">Start
        free tutorial
        <i class="fas fa-graduation-cap ml-2"></i>
      </a>
    </div>
    -->
    <!--/.Call to action-->

    <hr class="my-4">

    <!-- Social icons 
    <div class="pb-4">
      <a href="https://www.facebook.com/mdbootstrap" target="_blank">
        <i class="fab fa-facebook-f mr-3"></i>
      </a>

      <a href="https://twitter.com/MDBootstrap" target="_blank">
        <i class="fab fa-twitter mr-3"></i>
      </a>

      <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
        <i class="fab fa-youtube mr-3"></i>
      </a>

      <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
        <i class="fab fa-google-plus-g mr-3"></i>
      </a>

      <a href="https://dribbble.com/mdbootstrap" target="_blank">
        <i class="fab fa-dribbble mr-3"></i>
      </a>

      <a href="https://pinterest.com/mdbootstrap" target="_blank">
        <i class="fab fa-pinterest mr-3"></i>
      </a>

      <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
        <i class="fab fa-github mr-3"></i>
      </a>

      <a href="http://codepen.io/mdbootstrap/" target="_blank">
        <i class="fab fa-codepen mr-3"></i>
      </a>
    </div>
    -->
    <!-- Social icons -->
        
    <!-- Contact us -->
    <div class="pb-4">
    	<%=com.abanate.com.util.ConstUtil.MY_COUP_EMAIL%>
    </div>
    <!-- /Contact us -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2019 Copyright:
      <a href="./index.html"> <%=com.abanate.com.util.ConstUtil.MY_COUP_EMAIL%> </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->
  
  	<!-- Modal -->
	<div class="modal fade" id="comModal" tabindex="-1" role="dialog" aria-labelledby="common modal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="comModalTitle">-</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="comModalBody">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">Save changes</button>
	        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="../../js/mycoup/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" defer src="../../js/mycoup/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" defer src="../../js/mycoup/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" defer src="../../js/mycoup/mdb.min.js"></script>
  <!-- Utilities -->
  <script type="text/javascript" src="../../js/com/util.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
  <script type="text/javascript" src="../../js/com/i18n.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    // new WOW().init();

  </script>