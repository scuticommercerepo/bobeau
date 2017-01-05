<?php
/**
 * Template Name: Home Template
 */


get_header(); ?>



<div class="container">
<div class="row">
<?php

$args = new WP_Query( 'cat=1&showposts=-1&orderby=date' );
if ( $args->have_posts() )
{
    while( $args->have_posts() )
    {
        $args->the_post();
        get_template_part( 'template-parts/home-content', 'post' );
    }
    wp_reset_postdata();
} ?>
</div>php</div>

	<?php	get_footer(); ?>