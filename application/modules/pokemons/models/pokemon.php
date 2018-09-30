<?php

if ( ! defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

class Pokemon extends MY_Model {

    function __construct()
    {
        parent::__construct();

        $this->db_table = 'pokemons';
    }

    public function get_all() {
        return $this->find(
            'all', array(
                'select' => '*',
                'order' => array(
                    'name' => 'asc',
                ),
            )
        );
    }

    //
    public function get_publish_article($article_id, $lang_id)
    {
        $select
            = 'ad.*, articles.is_allow_comment AS is_allow_comment, articles.publish_date as publish_date, articles.data_category as data_category,articles.thumbnail_image as thumbnail_image';
        $article = $this->find(
            'first_array', array(
                'select' => $select,
                'leftjoin' => array('article_dictionaries ad' => 'ad.article_id = articles.id'),
                'where' => array(
                    'articles.id' => $article_id,
                    'ad.lang_id' => $lang_id,
                    'articles.is_delete' => 0,
                    'articles.is_publish' => 1,
                    'articles.publish_date <=' => date('Y-m-d H:i:s'),
                ),
            )
        );

        return $article;
    }

    /**
     *
     * search articles by language, category (optional: and date publish)
     *
     * @param integer $lang_id
     * @param mix $category_id
     * @param datetime $from_datetime (optional)
     * @param datetime $to_datetime (optional)
     * @param integer $count
     * @param integer $offset
     *
     * @return array
     */
    function search_by_category_and_date(
        $lang_id,
        $category_ids,
        $from_datetime = NULL,
        $to_datetime = NULL,
        $count = 10,
        $offset = 0
    )
    {

        if ( ! is_array($category_ids))
        {
            $category_ids = array($category_ids);
        }

        $where = array(
            'articles.is_publish' => 1,
            'ad.lang_id' => $lang_id,
            'articles.is_delete' => 0,
        );

        if ($from_datetime)
        {
            $where['articles.publish_date >='] = $from_datetime;
        }

        $current_datetime = date('Y-m-d H:i:s', time());
        if ($to_datetime && $to_datetime <= $current_datetime)
        {
            $where['articles.publish_date <='] = $to_datetime;
        } else
        {
            $where['articles.publish_date <='] = $current_datetime;
        }

        $option = array(
            'select' => 'articles.*, ad.subject as subject, ad.teaser as teaser, ad.tags as tags, ad.slug as slug',
            'leftjoin' => array(
                'article_dictionaries ad' => 'ad.article_id = articles.id',
                'article_category_relationships acr' => 'acr.article_id = articles.id',
            ),
            'where' => $where,
            'where_in' => array('acr.article_category_id' => $category_ids),
            'groupby' => array('articles.id'),
            'order' => array(
                'articles.publish_date' => 'desc',
                'ad.subject' => 'asc',
            ),
        );

        $this->count_record = $this->find('count', $option);

        $option['limit'] = $count;
        $option['offset'] = $offset;
        $articles = $this->find('all', $option);

        return $articles;
    }

    /**
     *
     * Search articles by tag
     *
     * @param integer $lang_id
     * @param string $tag
     * @param integer $count
     * @param integer $offset
     *
     * @return array
     */
    function search_by_tag($lang_id, $tag, $count = 10, $offset = 0)
    {
        $array_keyword = explode(" ", $tag);
        $like_array = array();
        foreach ($array_keyword as $word)
        {
            $like_query = array(
                'tags' => $word,
            );
            array_push($like_array, $like_query);
        }

        $where = array(
            'articles.is_publish' => 1,
            'ad.lang_id' => $lang_id,
            'articles.is_delete' => 0,
            'articles.publish_date <=' => date('Y-m-d H:i:s'),
        );

        $articles = $this->find(
            'all', array(
                'select' => 'articles.*, ad.subject as subject, ad.teaser as teaser, ad.tags as tags, ad.slug as slug',
                'leftjoin' => array(
                    'article_dictionaries ad' => 'ad.article_id = articles.id',
                    'article_category_relationships acr' => 'acr.article_id = articles.id',
                ),
                'where' => $where,
                'like' => $like_array,
                'groupby' => array('articles.id'),
                'order' => array(
                    'articles.publish_date' => 'desc',
                    'ad.subject' => 'asc',
                ),
                'limit' => $count,
                'offset' => $offset,
            )
        );

        return $articles;
    }

    /**
     *
     * get hot articles
     *
     * @param integer $lang_id
     * @param integer $category_id
     * @param integer $limit
     * @param integer $offset
     *
     * @return array
     */
    function get_hot_articles($lang_id, $category_id, $count = 10, $offset = 0)
    {
        $articles = $this->find(
            'all', array(
                'select' => 'articles.*, ad.subject as subject, ad.teaser as teaser, ad.tags as tags, ad.slug as slug',
                'leftjoin' => array(
                    'article_dictionaries ad' => 'ad.article_id = articles.id',
                    'article_category_relationships acr' => 'acr.article_id = articles.id',
                ),
                'where' => array(
                    'acr.article_category_id' => $category_id,
                    'articles.is_publish' => 1,
                    'articles.is_hot >=' => 1,
                    'ad.lang_id' => $lang_id,
                    'articles.is_delete' => 0,
                    'articles.publish_date <=' => date('Y-m-d H:i:s', time()),
                ),
                'groupby' => array('articles.id'),
                'order' => array(
                    'articles.publish_date' => 'desc',
                    'ad.subject' => 'asc',
                ),
                'limit' => $count,
                'offset' => $offset,
            )
        );

        return $articles;
    }

    /**
     *
     * get hot articles
     *
     * @param integer $lang_id
     * @param integer $category_id
     * @param integer $limit
     * @param integer $offset
     *
     * @return array
     */
    function get_hot_articles_mixed($lang_id, $count = 10, $offset = 0)
    {
        $articles = $this->find(
            'all', array(
                'select' => 'articles.*, ad.subject as subject, ad.teaser as teaser, ad.tags as tags, ad.slug as slug',
                'leftjoin' => array(
                    'article_dictionaries ad' => 'ad.article_id = articles.id',
                    'article_category_relationships acr' => 'acr.article_id = articles.id',
                ),
                'where' => array(
                    'articles.is_publish' => 1,
                    'articles.is_hot >=' => 1,
                    'ad.lang_id' => $lang_id,
                    'articles.is_delete' => 0,
                    'articles.publish_date <=' => date('Y-m-d H:i:s', time()),
                ),
                'groupby' => array('articles.id'),
                'order' => array(
                    'articles.publish_date' => 'desc',
                    'ad.subject' => 'asc',
                ),
                'limit' => $count,
                'offset' => $offset,
            )
        );

        return $articles;
    }

    /**
     *
     * get the most view articles
     *
     * @param integer $lang_id
     * @param integer $category_id
     * @param integer $count
     * @param integer $offset
     *
     * @return array
     */
    public function get_newest_articles(
        $lang_id,
        $category_id,
        $count = 10,
        $offset = 0
    )
    {
        $articles = $this->find(
            'all', array(
                'select' => 'articles.*, ad.subject as subject, ad.teaser as teaser, ad.tags as tags, ad.slug as slug',
                'leftjoin' => array(
                    'article_dictionaries ad' => 'ad.article_id = articles.id',
                    'article_category_relationships acr' => 'acr.article_id = articles.id',
                ),
                'where' => array(
                    'acr.article_category_id' => $category_id,
                    'articles.is_publish' => 1,
                    'ad.lang_id' => $lang_id,
                    'articles.is_delete' => 0,
                    'articles.publish_date <=' => date('Y-m-d H:i:s', time()),
                ),
                'groupby' => array('articles.id'),
                'order' => array(
                    'articles.publish_date' => 'desc',
                    'ad.subject' => 'asc',
                ),
                'limit' => $count,
                'offset' => $offset,
            )
        );

        return $articles;
    }

    /**
     *
     * get the most view articles
     *
     * @param integer $lang_id
     * @param integer $category_id
     * @param integer $count
     * @param integer $offset
     *
     * @return array
     */
    function get_most_view_articles(
        $lang_id,
        $category_id,
        $count = 10,
        $offset = 0
    )
    {
        $articles = $this->find(
            'all', array(
                'select' => 'articles.*, ad.subject as subject, ad.teaser as teaser, ad.slug as slug',
                'leftjoin' => array(
                    'article_dictionaries ad' => 'ad.article_id = articles.id',
                    'article_category_relationships acr' => 'acr.article_id = articles.id',
                ),
                'where' => array(
                    'acr.article_category_id' => $category_id,
                    'articles.is_publish' => 1,
                    'ad.lang_id' => $lang_id,
                    'articles.is_delete' => 0,
                    'articles.publish_date <=' => date('Y-m-d H:i:s', time()),
                ),
                'groupby' => array('articles.id'),
                'order' => array(
                    'articles.counter_view' => 'desc',
                    'ad.subject' => 'asc',
                ),
                'limit' => $count,
                'offset' => $offset,
            )
        );

        return $articles;
    }

    public function update_voting($article_id, $score)
    {
        $this->db->set('counter_user_voting', 'counter_user_voting + 1', FALSE);
        $this->db->set(
            'total_voting_point', 'total_voting_point + ' . $score, FALSE
        );
        $this->db->set('modified', date('Y-m-d H:i:s'));
        $this->db->where('id', $article_id);
        $this->db->update($this->db_table);
    }

    public function get_list_article(
        $difference_id = 0,
        $category_id = 0,
        $limit = 5
    )
    {
        $this->paginator['select']
            = array('articles.*, ad.subject as subject, ad.teaser as teaser, ad.tags as tags, ad.slug as slug');
        //join
        $this->paginator['join'] = array(
            'article_dictionaries ad' => 'ad.article_id = articles.id',
            'article_category_relationships acr' => 'acr.article_id = articles.id',
        );
        //where
        $this->paginator['where'] = array(
            'articles.is_publish' => 1,
            'ad.lang_id' => config_item("lang_data")[lang_web()],
            'articles.is_delete' => 0,
            'articles.publish_date <=' => date('Y-m-d H:i:s', time()),
        );

        if ($difference_id != 0)
        {
            //where
            $this->paginator['where']['articles.id !='] = $difference_id;
        }
        if ($category_id != 0)
        {
            //where
            $this->paginator['where']['acr.article_category_id'] = $category_id;
        }
        //order
        $this->paginator['order'] = array(
            'articles.publish_date' => 'desc',
            'ad.subject' => 'asc',
        );

        $this->paginator['limit'] = $limit;

        $uri_segment = 3;
        // get Article Category
        $list_articles = $this->pagination($uri_segment);
        $pagination_link = $this->getPaginationCustom(
            'frontend', 'tin-tuc-ship-hang-my', '', '', $uri_segment
        );

        $data = array(
            'list_articles' => $list_articles,
            'pagination_link' => $pagination_link,
        );

        return $data;
    }

}

?>