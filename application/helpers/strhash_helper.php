<?php if ( ! defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

/**
 * hash string
 *
 * @param string  $string hash
 * @param boolean $encode
 *
 * @return string hash
 */
if ( ! function_exists('string_hash'))
{
    function string_hash($string, $encode = TRUE)
    {
        if ($encode)
        {
            $string_base  = @base64_encode(@convert_uuencode($string));
            $time_convert = @base64_encode(@convert_uuencode(time()));

            $string_rand = $string_base . '|' . $time_convert;

            return @base64_encode(
                @base64_encode(@convert_uuencode($string_rand))
            );
        } else
        {
            $string_rand = @convert_uudecode(
                @base64_decode(@base64_decode($string))
            );

            $string_array = explode('|', $string_rand);

            $string_base = $string_array[0];

            return @convert_uudecode(@base64_decode($string_base));
        }
    }
}
