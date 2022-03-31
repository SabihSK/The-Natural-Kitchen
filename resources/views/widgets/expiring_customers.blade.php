<div class="col-md-12">
    <div class="panel panel-primary">
        <div class="panel-heading" style="color: #fff;padding: 2px 10px 10px">
            <h3>Customers with Subscriptions Expiring Soon</h3>
            <small>The below list is for customers subscribed for specific weeks only</small>
        </div>
        <div class="panel-body">
            <br>
            <table id="example" class="table table-hover table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>Name</th>
                    <th style="display: none">Near</th>
                    <th data-sort='<%= my_date.strftime("%Y%m%d%H%M%s") %>'>Expiring Date</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                @foreach ($customers as $customer)
                    <tr class=" @if($customer->near) warning @endif">
                        <td>{{$customer->fullname}}</td>
                        <td style="display: none">{{$customer->near}}</td>
                        <td>{{ date('d-m-Y', strtotime($customer->weeks->first()->enddate)) }}</td>
                        <td>
                            <a href="{{route('voyager.customers.edit', ['customer' => $customer->id])}}" class="btn btn-info" target="_blank" style="text-decoration: none">Profile</a>
                        </td>
                    </tr>
                @endforeach

                </tbody>
                <tfoot>
                <tr>
                    <th>Name</th>
                    <th style="display: none">Near</th>
                    <th>Expiring Date</th>
                    <th>Action</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>

<script>
        window.onload =function () {
            var dt = $('#example').DataTable({
                "order": [[ 1, "ASC" ]]
            });
            console.log(dt);
        }
</script>
