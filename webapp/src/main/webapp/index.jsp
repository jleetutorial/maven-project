<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, shrink-to-fit=no">

  <title>Parking lot for Buy me a coffee</title>
  <meta name="description" content="Parking Lot - Register and Get your Parking Slot.">
  <meta name="author" content="Liyas Thomas">

  <!-- Bootstrap core CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">
  <link rel="stylesheet" href="css/app.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:700,900&display=swap" rel="stylesheet">

</head>
<body>

  <div class="container">
    <div class="page-header-extended">
      <h4 class="page-title">Parking lot for Buy me a coffee</h4>
    </div>
    <div class="info-table-header-block">
      <input type="text" placeholder="Search vehicles by Registration no, Owner name, Email, Date of allocation, Slot etc." id="member_search" onkeyup="getTableData()">
    </div>
    <div class="starter-template">
      <div class="info-table-header-block">
        <button type="button slot" class="btn btn-primary slot-button" data-toggle="modal" data-target="#addnewModal">
          Add new vehicle
        </button>
      </div>
      <!-- Modal -->
      <div class="modal fade" id="addnewModal" tabindex="-1" role="dialog" aria-labelledby="addnewModalTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="addnewModalTitle">Add new vehicle</h4>
            </div>
            <!-- User Create Modal Start -->
            <div class="modal-body">
              <form id="saveMemberInfo">
                <div class="form-group">
                  <label for="reg_no">Registration no
                    <span class="required-field">*</span>
                  </label>
                  <input type="text" class="form-control" placeholder="Enter registration no:" id="reg_no" required />
                </div>
                <div class="form-group">
                  <label for="owner_name">Owner name
                    <span class="required-field">*</span>
                  </label>
                  <input type="text" class="form-control" placeholder="Enter owner name:" id="owner_name" required />
                </div>
                <div class="form-group">
                  <label for="email">Email
                    <span class="required-field">*</span>
                  </label>
                  <input type="email" class="form-control" placeholder="Enter email" id="email" required />
                </div>
                <div class="form-group">
                  <label for="d_o_a">Date of allocation
                    <span class="required-field">*</span>
                  </label>
                  <input type="text" class="form-control" placeholder="Enter date of allocation" id="d_o_a" required onkeypress="return false;" />
                </div>
                <div class="form-group">
                  <label for="slot">Slot number
                    <span class="required-field">*</span>
                  </label>
                  <input type="number" class="form-control" placeholder="Enter slot number" id="slot" required min="1" max="10" maxlength="2">
                </div>
                <div class="modal-footer-extended">
                  <button type="submit" class="btn btn-primary">Create</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
              </form>
            </div>
            <!-- User Create Modal End -->
          </div>
        </div>
      </div>
      <table id="member_table" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>
              <a href="#" onclick="sortBy('reg_no')">Registration no</a>
            </th>
            <th>
              <a href="#" onclick="sortBy('owner_name')">Owner name</a>
            </th>
            <th>
              <a href="#" onclick="sortBy('email')">Email</a>
            </th>
            <th>
              <a href="#" onclick="sortBy('d_o_a')">Date of allocation</a>
            </th>
            <th>
              <a href="#" onclick="sortBy('slot')">Slot number</a>
            </th>
            <th>Actions</th>
          </tr>
        </thead>
      </table>
      <div class="show-table-info hide">
        <div class="alert alert-info center">
          <strong>Parking lot is empty</strong>
        </div>
      </div>
      <footer>
        Made by Liyas Thomas | <a href="https://github.com/liyasthomas/parkinglot">GitHub</a>
      </footer>
    </div>
  </div>
  <!-- User Information Modal Start -->
  <div id="show_user_info">
    <div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="showModalTitle" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="showModal">Vehicle Information</h4>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="show_reg_no">Registration no</label>
              <input type="text" class="form-control" id="show_reg_no" value="" disabled>
            </div>
            <div class="form-group">
              <label for="show_owner_name">Owner name</label>
              <input type="text" class="form-control" id="show_owner_name" value="" disabled>
            </div>
            <div class="form-group">
              <label for="show_email">Email</label>
              <input type="email" class="form-control" id="show_email" value="" disabled>
            </div>
            <div class="form-group">
              <label for="show_d_o_a">Date of allocation</label>
              <input type="text" class="form-control" id="show_d_o_a" value="" disabled>
            </div>
            <div class="form-group">
              <label for="show_slot">Slot number</label>
              <input type="number" class="form-control" id="show_slot" value="" disabled>
            </div>
            <div class="modal-footer-extended">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- User Information Modal End -->
  <!-- User Edit Modal Start -->
  <div id="show_user_info">
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalTitle" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="editModal">Edit Vehicle Information</h4>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="edit_reg_no">Registration no
                  <span class="required-field">*</span>
                </label>
                <input type="text" class="form-control" id="edit_reg_no" value="" required />
              </div>
              <div class="form-group">
                <label for="edit_owner_name">Owner name
                  <span class="required-field">*</span>
                </label>
                <input type="text" class="form-control" id="edit_owner_name" value="" required />
              </div>
              <div class="form-group">
                <label for="edit_email">Email
                  <span class="required-field">*</span>
                </label>
                <input type="email" class="form-control" id="edit_email" value="" required />
              </div>
              <div class="form-group">
                <label for="edit_d_o_a">Date of allocation
                  <span class="required-field">*</span>
                </label>
                <input type="text" class="form-control" id="edit_d_o_a" value="" required onkeypress="return false;" />
              </div>
              <div class="form-group">
                <label for="edit_slot">Slot number
                  <span class="required-field">*</span>
                </label>
                <input type="number" class="form-control" id="edit_slot" value="" required />
              </div>
              <div class="form-group">
                <input type="hidden" class="form-control" id="member_id">
              </div>
              <div class="modal-footer-extended">
                <button type="button" class="btn btn-success" onclick="updateMemberData();">Update</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- User Edit Modal End -->
  <!-- Delete Confirmation Dialog Start -->
  <div id="show_user_info">
    <div class="modal fade" id="deleteDialog" tabindex="-1" role="dialog" aria-labelledby="deleteDialogTitle" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="deleteDialog">Warning!</h4>
          </div>
          <div class="modal-body">
            <h4>Are you sure, want to delete this vehicle? </h4>
            <input type="hidden" id="deleted-member-id" value="">
            <div class="modal-footer-extended">
              <button class="btn btn-danger" onclick="deleteMemberData()">Delete</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Delete Confirmation Dialog End -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="js/app.js"></script>

</body>
</html>
