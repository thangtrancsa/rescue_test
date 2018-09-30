<?php

(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * VPBASECMS
 *
 * @author     dungdv <tonydoan@vpsolution.co>
 * @copyright  Doan Viet Dung 2015
 *
 * Add MY_Input core class
 *
 * @package    PenguinFW
 * @subpackage Core
 * @version    1.0.0
 */
class MY_Input extends CI_Input {
    function __construct()
    {
        parent::__construct();
    }

    public function named($index)
    {
        if (strpos(uri_string(), "/$index.") !== FALSE)
        {
            $value_first = preg_replace(
                sprintf('/.*\/%s./', $index), '', uri_string()
            );
            $value       = preg_replace('/\/.*/', '', $value_first);

            return $value;
        }

        return FALSE;
    }
}