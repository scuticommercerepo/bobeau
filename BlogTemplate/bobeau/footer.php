<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package bobeau
 */

?>

	</div><!-- #content -->
	<div class="inst-bg">
<div class="container">
<div class="row">
<div class="col-md-12" style="text-align: center; overflow: hidden;">
            <h2 class="inst-hd">#LOVEBOBEAU</h2>
            <h5 class="inst-sub-hd">Find us on Instagram<span>@lovebobeau.</span></h5>
	<?php echo do_shortcode('[jr_instagram id="2"]'); ?>
</div>
</div>
</div>
</div>
	<footer id="colophon" class="site-footer" role="contentinfo">
	  <div class="container">
  <div class="row">
  <div class="col-md-3">
		<?php $arg = array('menu'=>'Footer Menu1 '); //Fetch the header menu
	    	  wp_nav_menu($arg);
	 		  ?>
</div>
<div class="col-md-3">
		<?php $arg1 = array('menu'=>'Footer Menu2 '); //Fetch the header menu
	    	  wp_nav_menu($arg1);
	 		  ?>
</div>
<div class="col-md-3">
		<?php $arg2 = array('menu'=>'Footer Menu3 '); //Fetch the header menu
	    	  wp_nav_menu($arg2);
	 		  ?>
</div>
<div class="col-md-3">
		<?php $arg3 = array('menu'=>'Footer Menu4 '); //Fetch the header menu
	    	  wp_nav_menu($arg3);
	 		  ?>
</div>
</div>
<div class="copy">&copy;2016 Bobeau</div>
</div>
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
