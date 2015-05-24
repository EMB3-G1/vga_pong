-------------------------------------------------------------------------------
-- Copyright (c) 2015 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : chipscope_vio.vhd
-- /___/   /\     Timestamp  : Mon May 04 16:02:52 CEST 2015
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY chipscope_vio IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    ASYNC_IN: in std_logic_vector(1 downto 0);
    ASYNC_OUT: out std_logic_vector(1 downto 0));
END chipscope_vio;

ARCHITECTURE chipscope_vio_a OF chipscope_vio IS
BEGIN

END chipscope_vio_a;
