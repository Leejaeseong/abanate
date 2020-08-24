<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script language="javascript">
 	var footMLang = new Map();
 	footMLang.set( "cal_mon_short"			, '${mLang["cal_mon_short" 				]}' );
 	footMLang.set( "cal_tue_short"			, '${mLang["cal_tue_short" 				]}' );
 	footMLang.set( "cal_wed_short"			, '${mLang["cal_wed_short" 				]}' );
 	footMLang.set( "cal_thu_short"			, '${mLang["cal_thu_short" 				]}' );
 	footMLang.set( "cal_fri_short"			, '${mLang["cal_fri_short" 				]}' );
 	footMLang.set( "cal_sat_short"			, '${mLang["cal_sat_short" 				]}' );
 	footMLang.set( "cal_sun_short"			, '${mLang["cal_sun_short" 				]}' );
 	footMLang.set( "cal_mon_long"			, '${mLang["cal_mon_long" 				]}' );
 	footMLang.set( "cal_tue_long"			, '${mLang["cal_tue_long" 				]}' );
 	footMLang.set( "cal_wed_long"			, '${mLang["cal_wed_long" 				]}' );
 	footMLang.set( "cal_thu_long"			, '${mLang["cal_thu_long" 				]}' );
 	footMLang.set( "cal_fri_long"			, '${mLang["cal_fri_long" 				]}' );
 	footMLang.set( "cal_sat_long"			, '${mLang["cal_sat_long" 				]}' );
 	footMLang.set( "cal_sun_long"			, '${mLang["cal_sun_long" 				]}' );
 	footMLang.set( "cal_jan_short"			, '${mLang["cal_jan_short" 				]}' );
 	footMLang.set( "cal_feb_short"			, '${mLang["cal_feb_short" 				]}' );
 	footMLang.set( "cal_mar_short"			, '${mLang["cal_mar_short" 				]}' );
 	footMLang.set( "cal_apr_short"			, '${mLang["cal_apr_short" 				]}' );
 	footMLang.set( "cal_may_short"			, '${mLang["cal_may_short" 				]}' );
 	footMLang.set( "cal_jun_short"			, '${mLang["cal_jun_short" 				]}' );
 	footMLang.set( "cal_jul_short"			, '${mLang["cal_jul_short" 				]}' );
 	footMLang.set( "cal_aug_short"			, '${mLang["cal_aug_short" 				]}' );
 	footMLang.set( "cal_sep_short"			, '${mLang["cal_sep_short" 				]}' );
 	footMLang.set( "cal_oct_short"			, '${mLang["cal_oct_short" 				]}' );
 	footMLang.set( "cal_nov_short"			, '${mLang["cal_nov_short" 				]}' );
 	footMLang.set( "cal_dec_short"			, '${mLang["cal_dec_short" 				]}' );
 	footMLang.set( "cal_jan_long"			, '${mLang["cal_jan_long" 				]}' );
 	footMLang.set( "cal_feb_long"			, '${mLang["cal_feb_long" 				]}' );
 	footMLang.set( "cal_mar_long"			, '${mLang["cal_mar_long" 				]}' );
 	footMLang.set( "cal_apr_long"			, '${mLang["cal_apr_long" 				]}' );
 	footMLang.set( "cal_may_long"			, '${mLang["cal_may_long" 				]}' );
 	footMLang.set( "cal_jun_long"			, '${mLang["cal_jun_long" 				]}' );
 	footMLang.set( "cal_jul_long"			, '${mLang["cal_jul_long" 				]}' );
 	footMLang.set( "cal_aug_long"			, '${mLang["cal_aug_long" 				]}' );
 	footMLang.set( "cal_sep_long"			, '${mLang["cal_sep_long" 				]}' );
 	footMLang.set( "cal_oct_long"			, '${mLang["cal_oct_long" 				]}' );
 	footMLang.set( "cal_nov_long"			, '${mLang["cal_nov_long" 				]}' );
 	footMLang.set( "cal_dec_long"			, '${mLang["cal_dec_long" 				]}' );
 	footMLang.set( "erroccurgomain_br"		, '${mLang["erroccurgomain_br" 			]}' );
 	footMLang.set( "erroccurcontactadmin_br", '${mLang["erroccurcontactadmin_br"	]}' );
  </script>
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