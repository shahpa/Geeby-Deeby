/* Hide the row of the specified user after processing is complete:
 */
function hideUserRow(userID)
{
    var o = document.getElementById('NewUser_' + userID);
    if (o) {
        o.style.display = 'none';
    }
}

/* Hide the controls associated with a particular user:
 */
function hideUserButtons(userID)
{
    var o = document.getElementById('UserButtons_' + userID);
    if (o) {
        o.innerHTML = 'Working...';
    }
}

/* Approve the specified user:
 */
function approveUser(userID)
{
    // Hide buttons to prevent double-click:
    hideUserButtons(userID);
    
    // Use AJAX to save the values:
    var url = 'ajax.php?module=approve&method=approveUser';
    var details = {
        id: userID,
        person_id: parseInt($('#Person_ID_' + userID).val()),
        username: $('#Username_' + userID).val(),
        fullname: $('#Name_' + userID).val(),
        address: $('#Address_' + userID).val()
    };
    $.post(url, details, function(data) {
        // If save failed, display error message.
        if (!data.success) {
            alert('Error: ' + data.msg);
        }
        
        // Hide row now that processing is complete.
        hideUserRow(userID);
    }, 'json');
}

/* Reject the specified user:
 */
function rejectUser(userID)
{
    if (!confirm("Are you sure?")) {
        return;
    }
    
    // Hide buttons to prevent double-click:
    hideUserButtons(userID);
    
    // Use AJAX to save the values:
    var url = 'ajax.php?module=approve&method=rejectUser';
    var details = {
        id: userID
    };
    $.post(url, details, function(data) {
        // If save failed, display error message.
        if (!data.success) {
            alert('Error: ' + data.msg);
        }
        
        // Hide row now that processing is complete.
        hideUserRow(userID);
    }, 'json');
}

/* Hide the row of the specified review after processing is complete:
 */
function hideReviewRow(userID, itemID)
{
    var o = document.getElementById('PendingReview_' + userID + '_' + itemID);
    if (o) {
        o.style.display = 'none';
    }
}

/* Hide the controls associated with a particular review:
 */
function hideReviewButtons(userID, itemID)
{
    var o = document.getElementById('ReviewButtons_' + userID + '_' + itemID);
    if (o) {
        o.innerHTML = 'Working...';
    }
}

/* Approve a review
 */
function approveReview(userID, itemID)
{
    // Hide buttons to prevent double-click:
    hideReviewButtons(userID, itemID);
    
    // Use AJAX to save the values:
    var url = 'ajax.php?module=approve&method=approveReview';
    var details = {
        user_id: userID,
        item_id: itemID,
        text: $('#ReviewText_' + userID + '_' + itemID).val()
    };
    $.post(url, details, function(data) {
        // If save failed, display error message.
        if (!data.success) {
            alert('Error: ' + data.msg);
        }
        
        // Hide row now that processing is complete.
        hideReviewRow(userID, itemID);
    }, 'json');
}

/* Reject a review
 */
function rejectReview(userID, itemID)
{
    if (!confirm("Are you sure?")) {
        return;
    }
    
    // Hide buttons to prevent double-click:
    hideReviewButtons(userID, itemID);
    
    // Use AJAX to save the values:
    var url = 'ajax.php?module=approve&method=rejectReview';
    var details = {
        user_id: userID,
        item_id: itemID
    };
    $.post(url, details, function(data) {
        // If save failed, display error message.
        if (!data.success) {
            alert('Error: ' + data.msg);
        }
        
        // Hide row now that processing is complete.
        hideReviewRow(userID, itemID);
    }, 'json');
}

/* Hide the row of the specified comment after processing is complete:
 */
function hideCommentRow(userID, seriesID)
{
    var o = document.getElementById('PendingComment_' + userID + '_' + seriesID);
    if (o) {
        o.style.display = 'none';
    }
}

/* Hide the controls associated with a particular comment:
 */
function hideCommentButtons(userID, seriesID)
{
    var o = document.getElementById('CommentButtons_' + userID + '_' + seriesID);
    if (o) {
        o.innerHTML = 'Working...';
    }
}

/* Approve a comment
 */
function approveComment(userID, seriesID)
{
    // Hide buttons to prevent double-click:
    hideCommentButtons(userID, seriesID);
    
    // Use AJAX to save the values:
    var url = 'ajax.php?module=approve&method=approveComment';
    var details = {
        user_id: userID,
        series_id: seriesID,
        text: $('#CommentText_' + userID + '_' + seriesID).val()
    };
    $.post(url, details, function(data) {
        // If save failed, display error message.
        if (!data.success) {
            alert('Error: ' + data.msg);
        }
        
        // Hide row now that processing is complete.
        hideCommentRow(userID, seriesID);
    }, 'json');
}

/* Reject a comment
 */
function rejectComment(userID, seriesID)
{
    if (!confirm("Are you sure?")) {
        return;
    }
    
    // Hide buttons to prevent double-click:
    hideCommentButtons(userID, seriesID);
    
    // Use AJAX to save the values:
    var url = 'ajax.php?module=approve&method=rejectComment';
    var details = {
        user_id: userID,
        series_id: seriesID
    };
    $.post(url, details, function(data) {
        // If save failed, display error message.
        if (!data.success) {
            alert('Error: ' + data.msg);
        }
        
        // Hide row now that processing is complete.
        hideCommentRow(userID, seriesID);
    }, 'json');
}

// Activate page controls on domready:
$(document).ready(function(){
    options = {
        url: "ajax.php", 
        extraParams: {module: "people", method: "suggest" }, 
        highlight: false
    };
    $('.Person_ID').autocomplete(options);
});
