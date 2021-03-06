<?php
/**
  *
  * Copyright (c) Demian Katz 2009.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2,
  * as published by the Free Software Foundation.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  *
  */
require_once 'Gamebooks/Tables/Person.php';
require_once 'Gamebooks/Tables/Role.php';

/**
 * Handler for people page.
 *
 * @param   UI  $interface      Current instance of user interface class.
 */
function people($interface)
{
    // Load people and roles from database:
    $platforms = new PersonList();
    $platforms->assign($interface);
    $roles = new RoleList();
    $roles->assign($interface);
    
    // Display page with appropriate Javascript:
    $interface->addJavascript('edit_people.js');
    $interface->showPage('people.tpl');
}
?>