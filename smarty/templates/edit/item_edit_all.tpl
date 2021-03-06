<h1>Edit Item</h1>
<div class="edit_container" style="width: 800px;">
  {include file="item_edit.tpl"}
</div>
<hr />
<div id="tabs">
  <ul>
    <li><a href="#adaptations-tab"><span>Adaptations</span></a></li>
    <li><a href="#alt-titles-tab"><span>Alternate Titles</span></a></li>
    <li><a href="#attached-tab"><span>Attached Items</span></a></li>
    <li><a href="#codes-tab"><span>Codes/ISBNs</span></a></li>
    <li><a href="#credits-tab"><span>Credits</span></a></li>
    <li><a href="#release-tab"><span>Dates</span></a></li>
    <li><a href="#desc-tab"><span>Descriptions</span></a></li>
    <li><a href="#images-tab"><span>Images</span></a></li>
    <li><a href="#platforms-tab"><span>Platforms</span></a></li>
    <li><a href="#bib-tab"><span>References</span></a></li>
    <li><a href="#translations-tab"><span>Translations</span></a></li>
  </ul>

  <div id="adaptations-tab" class="edit_tab_contents">
    <select id="adapt_type">
      <option value='from'>Adapted From</option>
      <option value='into'>Adapted Into</option>
    </select>
    <input id="adapt_name" class="Item_ID" />
    <button onclick="saveAdaptation();">Add Adaptation</button>
    <table>
      <tr>
        <td>
          <b>Adapted From:</b>
          <div id="adapt_from">
            {include file="item_adapt_from.tpl"}
          </div>
        </td>
        <td>
          <b>Adapted Into:</b>
          <div id="adapt_into">
            {include file="item_adapt_into.tpl"}
          </div>
        </td>
      </tr>
    </table>
  </div>

  <div id="alt-titles-tab" class="edit_tab_contents">
    <b>Title:</b> <input type="text" id="Alt_Title" />
    <b>Note: </b> <input id="Alt_Title_Note" class="Note_ID" />
    <button onclick="addAltTitle();">Add</button>
    <div id="alt_title_list">
      {include file="item_alt_titles.tpl"}
    </div>
  </div>
  
  <div id="attached-tab" class="edit_tab_contents">
    <input id="attachment_name" class="Item_ID" />
    <button onclick="addAttachedItem();">Add Item</button>
    <div id="item_list">
      {include file="item_item_list.tpl"}
    </div>
  </div>
  
  <div id="bib-tab" class="edit_tab_contents">
    <p>The current item is about the following items, series and people...</p>
    <b>Item References:</b>
    <input id="item_bib_id" class="Item_ID" />
    <button onclick="addItemReference();">Add Reference</button>
    <div id="item_bib">
      {include file="item_bib.tpl"}
    </div>
    <b>Series References:</b>
    <input id="series_bib_id" class="Series_ID" />
    <button onclick="addSeriesReference();">Add Reference</button>
    <div id="series_bib">
      {include file="series_bib.tpl"}
    </div>
    <b>Person References:</b>
    <input id="person_bib_id" class="Person_ID" />
    <button onclick="addPersonReference();">Add Reference</button>
    <div id="people_bib">
      {include file="people_bib.tpl"}
    </div>
  </div>
  
  <div id="codes-tab" class="edit_tab_contents">
    <table>
      <tr>
        <td style="width: 50%;">
          <table class="edit">
            <tr><th>New ISBN</th><td><input type="text" id="isbn" /></td></tr>
            <tr><th>Note:</th><td><input id="isbn_note" class="Note_ID" /></td></tr>
            <tr><th></th><td><button onclick="addISBN();">Add</button></td></tr>
          </table>
          <b>ISBNs:</b>
          <div id="item_isbns">
            {include file="item_isbns.tpl"}
          </div>
        </td>
        <td>
          <table class="edit">
            <tr><th>New Code</th><td><input type="text" id="product_code" /></td></tr>
            <tr><th>Note:</th><td><input id="product_code_note" class="Note_ID" /></td></tr>
            <tr><th></th><td><button onclick="addProductCode();">Add</button></td></tr>
          </table>
          <b>Product Codes:</b>
          <div id="item_codes">
            {include file="item_codes.tpl"}
          </div>
        </td>
      </tr>
    </table>
  </div>
  
  <div id="credits-tab" class="edit_tab_contents">
    <div class="edit_container">
      <table class="edit">
        <tr>
          <th>Position:</th>
          <td><input type="text" id="credit_position" /></td>
        </tr>
        <tr>
          <th>Person:</th>
          <td><input id="credit_person" class="Person_ID" /></td>
        </tr>
        <tr>
          <th>Role:</th>
          <td>{include file="role_select.tpl"}</td>
        </tr>
        <tr>
          <th>Note:</th>
          <td><input id="credit_note" class="Note_ID" /></td>
        </tr>
        <tr>
          <th></th>
          <td><button onclick="saveCredit();">Add</button></td>
        </tr>
      </table>
    </div>
    <div id="credits">
      {include file="item_credits.tpl"}
    </div>
  </div>
  
  <div id="desc-tab" class="edit_tab_contents">
    <div class="edit_container">
      <table class="edit">
        <tr>
          <th>Description Type:</th>
          <td>
            <select id='DescriptionType'>
              {foreach from=$descriptionTypes item="currentDesc" key="currentVal"}
                <option value="{$currentVal|escape}">{$currentDesc|escape}</option>
              {/foreach}
            </select>
          </td>
        </tr>
        <tr>
          <th>Description:</th>
          <td>
            <textarea id='Description'></textarea>
          </td>
        </tr>
        <tr>
          <th></th>
          <td><button onclick="saveDescription();">Add</button></td>
        </tr>
      </table>
    </div>
    <div id="desc_list">
      {include file="item_descriptions.tpl"}
    </div>
  </div>
  
  <div id="images-tab" class="edit_tab_contents">
    <div class="edit_container">
      <table class="edit">
        <tr>
          <th>Image Path:</th>
          <td><input type="text" id="image_path" /></td>
        </tr>
        <tr>
          <th>Thumb Path:<br /><span class="note">(leave blank to add &quot;thumb&quot; to image filename)</span></th>
          <td><input type="text" id="thumb_path" /></td>
        </tr>
        <tr>
          <th>Position:</th>
          <td><input type="text" id="image_position" /></td>
        </tr>
        <tr>
          <th>Note:</th>
          <td><input id="image_note" class="Note_ID" /></td>
        </tr>
        <tr>
          <th></th>
          <td><button onclick="saveImage();">Add</button></td>
        </tr>
      </table>
    </div>
    <div id="image_list">
      {include file="item_images.tpl"}
    </div>
  </div>
  
  <div id="platforms-tab" class="edit_tab_contents">
    {include file="platform_select.tpl"}
    <button onclick="addPlatform();">Add Platform</button>
    <br/>
    <b>Platforms:</b>
    <div id="platform_list">
      {include file="item_platforms.tpl"}
    </div>
  </div>
  
  <div id="release-tab" class="edit_tab_contents">
    <div class="edit_container">
      <table class="edit">
        <tr>
          <th>Month:<br /><span class="note">(1-12, 0 for unknown)</span></th>
          <td><input type="text" id="releaseMonth" /></td>
        </tr>
        <tr>
          <th>Day:<br /><span class="note">(1-31, 0 for unknown)</span></th>
          <td><input type="text" id="releaseDay" /></td>
        </tr>
        <tr>
          <th>Year:<br /><span class="note">(-1 for unreleased)</span></th>
          <td><input type="text" id="releaseYear" /></td>
        </tr>
        <tr>
          <th>Note:</th>
          <td><input id="releaseNote" class="Note_ID" /></td>
        </tr>
        <tr>
          <th></th>
          <td>
            <button onclick="saveReleaseDate();">Add</button>
          </td>
        </tr>
      </table>
    </div>
    <div id="date_list">
      {include file="item_release_dates.tpl"}
    </div>
  </div>
  
  <div id="translations-tab" class="edit_tab_contents">
    <select id="trans_type">
      <option value='from'>Translated From</option>
      <option value='into'>Translated Into</option>
    </select>
    <input id="trans_name" class="Item_ID" />
    <button onclick="saveTranslation();">Add Translation</button>
    <table>
      <tr>
        <td>
          <b>Translated From:</b>
          <div id="trans_from">
            {include file="item_trans_from.tpl"}
          </div>
        </td>
        <td>
          <b>Translated Into:</b>
          <div id="trans_into">
            {include file="item_trans_into.tpl"}
          </div>
        </td>
      </tr>
    </table>
  </div>

</div>