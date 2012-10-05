# Liquid markup

https://github.com/shopify/liquid/wiki/liquid-for-designers


# Template data

https://github.com/mojombo/jekyll/wiki/template-data


# YAML Front Matter

https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter

layout: post
title: Blogging Like a Hacker


# Category Pages Plugin

http://recursive-design.com/projects/jekyll-plugins/

move generate_plugins.rb to _plugins folder
move category_index.html to _layouts folder
add category_dir: departments to _config.yml


# Exporting Wordpress posts for Jekyll import

SELECT p.post_title, 
      p.post_name, 
      p.post_date, 
      p.post_content, 
      p.post_excerpt, 
      p.ID, 
      p.guid,
      group_concat(t.slug)
FROM wp_posts p 
LEFT JOIN wp_term_relationships tr
ON tr.object_id = p.ID
LEFT JOIN wp_term_taxonomy tt
ON tr.term_taxonomy_id = tt.term_taxonomy_id
LEFT JOIN wp_terms t
ON t.term_id = tt.term_id
WHERE p.post_status = 'publish' AND p.post_type = 'post'
GROUP BY p.ID

