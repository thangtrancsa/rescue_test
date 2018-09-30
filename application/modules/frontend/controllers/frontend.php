<?php

if ( ! defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

/**
 * VPBASECMS
 *
 * @author     dungdv <tonydoan@vpsolution.co>
 * @copyright  Doan Viet Dung 2015
 *
 * Controller Frontend
 * ...
 *
 * @package    VPBASECMS
 * @subpackage Frontend
 * @version    2.0.0
 *
 * @property Article_category $Article_category
 * @property Product_part $product_part
 * @property Product_order $product_order
 */
class Frontend extends MY_Controller {

    function __construct()
    {
        parent::__construct();
        $this->layout->set_layout("rp_cus");
    }

    /**
     * home page
     */
    public function index()
    {
        $this->layout->set_title("Dashboard");

        $this->load->model('pokemons/Pokemon');

        $data['pokemons'] = $this->Pokemon->get_all();

        $this->parser->parse('dashboard', $data);
    }

    public function ajax_demo()
    {
        $this->layout->set_title("Ajax");

        $this->load->model('pokemons/Pokemon');

        $data['pokemons'] = $this->Pokemon->get_all();

        $this->parser->parse('ajax', $data);
    }

}
