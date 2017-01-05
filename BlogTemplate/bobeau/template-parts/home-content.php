<?php
/**
 * Template part for displaying posts
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package bobeau
 */

?>
<div class="col-md-4">
<?php

 
  the_post_thumbnail(); ?>
  <h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
    
 <?php $content = get_the_content();
  $trimmed_content = wp_trim_words( $content, 60, '<a href="'. get_permalink() .'">...[ read more ]</a>' ); ?>
  <p><?php echo $trimmed_content; ?></p>


</div>

