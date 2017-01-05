<?php
/**
 * Template part for displaying posts
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package bobeau
 */

?>


		<?php
		if ( is_single() ) :  ?>
			<div class="col-md-12">
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">			
			<?php the_post_thumbnail(); ?>
			<?php the_title( '<h1 class="entry-title ent-dtl">', '</h1>' ); ?>
			</header>
		<div class="entry-content dtl-cnt">
		<?php
			the_content( sprintf(
				/* translators: %s: Name of current post. */
				wp_kses( __( 'Continue reading %s <span class="meta-nav">&rarr;</span>', 'bobeau' ), array( 'span' => array( 'class' => array() ) ) ),
				the_title( '<span class="screen-reader-text">"', '"</span>', false )
			) );

			
		?>
	</div><!-- .entry-content -->
	
	</article>
	</div>
	<?php	else : ?>
		<div class="col-md-4">
		<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
		<?php the_post_thumbnail(); ?>
		<?php	the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h2>' );  ?>

			</header><!-- .entry-header -->
		<?php $content = get_the_content();
  $trimmed_content = wp_trim_words( $content, 60, '<a href="'. get_permalink() .'">...</a>' ); ?>
  <p><?php echo $trimmed_content; ?></p>
   <a href="<?php the_permalink() ?>" class="kn-mr">Know more</a>
<?php
		endif;
?>
	

	


</div>

