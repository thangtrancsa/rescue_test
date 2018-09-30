<?php

if ( ! defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

class Ajax extends MY_Controller {
    function __construct()
    {
        parent::__construct();
        $this->layout->disable_layout();
    }

    public function get_addresses()
    {
        $contact_id = $this->session->userdata("user_id");

        $this->load->model('contacts/Contact_address');

        $addresses = $this->Contact_address->find('all', array(
            'select' => 'id, address, country_id, country_name, zone_id, is_default',
            'where' => array(
                'contact_id' => $contact_id,
            ),
        ));

        if ($addresses)
        {

            $result = array(
                'error' => '0',
                'data' => array(
                    'addresses' => $addresses,
                ),
            );
            echo json_encode($result);

            return;
        } else
        {
            $result = array(
                'error' => '1',
                'msg' => 'Address not found',
            );
            echo json_encode($result);

            return;
        }
    }

    public function get_pokemon() {
        $key = $this->input->get('s');
        $this->load->model('pokemons/Pokemon');

        $result = $data['pokemons'] = $this->Pokemon->find('all', array(
            'select' => '*',
            'order' => array(
                'name' => 'asc',
            ),
            'like' => array (
                'name' => $key,
                'type' => $key
            ),
        ));

        echo json_encode($result);
        return;
    }
}