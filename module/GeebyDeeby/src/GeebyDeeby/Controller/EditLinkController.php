<?php
/**
 * Edit link controller
 *
 * PHP version 5
 *
 * Copyright (C) Demian Katz 2012.
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
 * @category GeebyDeeby
 * @package  Controller
 * @author   Demian Katz <demian.katz@villanova.edu>
 * @license  http://opensource.org/licenses/gpl-2.0.php GNU General Public License
 * @link     https://github.com/demiankatz/Geeby-Deeby Main Site
 */
namespace GeebyDeeby\Controller;

/**
 * Edit link controller
 *
 * @category GeebyDeeby
 * @package  Controller
 * @author   Demian Katz <demian.katz@villanova.edu>
 * @license  http://opensource.org/licenses/gpl-2.0.php GNU General Public License
 * @link     https://github.com/demiankatz/Geeby-Deeby Main Site
 */
class EditLinkController extends AbstractBase
{
    /**
     * Display a list of links
     *
     * @return mixed
     */
    public function listAction()
    {
        $view = $this->getGenericList(
            'link', 'links', 'geeby-deeby/edit-link/render-links'
        );
        // If this is not an AJAX request, we also want to display types:
        if (!$this->getRequest()->isXmlHttpRequest()) {
            $view->linkTypes = $this->typelistAction()->linkTypes;
        }
        return $view;
    }

    /**
     * Operate on a single link
     *
     * @return mixed
     */
    public function indexAction()
    {
        $assignMap = array(
            'link_name' => 'Link_Name', 'url' => 'URL',
            'desc' => 'Description', 'date_checked' => 'Date_Checked',
            'type_id' => 'Link_Type_ID'
        );
        $view = $this->handleGenericItem('link', $assignMap, 'link');
        $view->linkTypes = $this->typelistAction()->linkTypes;
        return $view;
    }

    /**
     * Display a list of types
     *
     * @return mixed
     */
    public function typelistAction()
    {
        return $this->getGenericList(
            'linkType', 'linkTypes', 'geeby-deeby/edit-link/render-types'
        );
    }

    /**
     * Operate on a single type
     *
     * @return mixed
     */
    public function typeAction()
    {
        $assignMap = array('linkType' => 'Link_Type');
        return $this->handleGenericItem('linkType', $assignMap, 'linkType');
    }
}