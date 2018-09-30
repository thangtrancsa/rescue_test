<?php if ( ! defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

/**
 * show data to debug
 *
 * @param string $uri
 *
 * @return string full link
 */
if ( ! function_exists('debug'))
{
    function debug($obj, $is_die = TRUE)
    {
        echo "<pre>";

        var_dump($obj);

        echo "</pre>";

        if ($is_die)
        {
            die;
        }
    }
}
