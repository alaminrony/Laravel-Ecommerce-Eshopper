<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style media="screen">
.invoice-title h2, .invoice-title h3 {
  display: inline-block;
}

.table > tbody > tr > .no-line {
  border-top: none;
}

.table > thead > tr > .no-line {
  border-bottom: none;
}

.table > tbody > tr > .thick-line {
  border-top: 2px solid;
}
</style>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Invoice</h2><h3 class="pull-right">Order #{{ $orderDetails->id }}</h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
            {{ $userDetails->name }} <br>
            {{ $userDetails->address }} <br>
            {{ $userDetails->city }} <br>
            {{ $userDetails->state }} <br>
            {{ $userDetails->country }} <br>
            {{ $userDetails->pincode }} <br>
            {{ $userDetails->mobile }} <br>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>Shipped To:</strong><br>
              {{ $orderDetails->name }} <br>
              {{ $orderDetails->address }} <br>
              {{ $orderDetails->city }} <br>
              {{ $orderDetails->state }} <br>
              {{ $orderDetails->country }} <br>
              {{ $orderDetails->pincode }} <br>
              {{ $orderDetails->mobile }} <br>
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    				{{ $orderDetails->payment_method }}
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					{{ $orderDetails->created_at }}<br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>

    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td class="text-left" style="width:18%"><strong>Product Code</strong></td>
        							<!-- <td class="text-center" style="width:20%"><strong>Product Name</strong></td> -->
        							<td class="text-center" style="width:18%"><strong>Product Size</strong></td>
                      <td class="text-center" style="width:18%"><strong>Product Color</strong></td>
                      <td class="text-center" style="width:18%"><strong>Product Price</strong></td>
                      <td class="text-center"style="width:18%"><strong>Product Qty</strong></td>
                      <td class="text-right" style="width:18%"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
                  <?php $subtotal =0;?>
                  @foreach($orderDetails->orders as $pro)
    							<tr>
    								<td class="text-left">{{ $pro->product_code }}</td>
    								<!-- <td class="text-center">{{ $pro->product_name }}</td> -->
    								<td class="text-center">{{ $pro->product_size }}</td>
                    <td class="text-center">{{ $pro->product_color }}</td>
    								<td class="text-center">$ {{ $pro->product_price }}</td>
    								<td class="text-center">{{ $pro->product_qty }}</td>
                    <td class="text-right">$ {{ $pro->product_price * $pro->product_qty }}</td>
    							</tr>
                  <?php $subtotal = $subtotal+($pro->product_price*$pro->product_qty);?>
                  @endforeach

    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
                    <td class="thick-line"></td>
                    <td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal</strong></td>
    								<td class="thick-line text-right">${{$subtotal}}</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
                    <td class="no-line"></td>
    								<td class="no-line"></td>
                    <td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping Charge (+)</strong></td>
    								<td class="no-line text-right">$ 0</td>
    							</tr>
                  <tr>
    								<td class="no-line"></td>
                    <td class="no-line"></td>
    								<td class="no-line"></td>
                    <td class="no-line"></td>
    								<td class="no-line text-center"><strong>Coupne Discount (-)</strong></td>
    								<td class="no-line text-right">$ {{ $orderDetails->coupon_amount }}</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
                    <td class="no-line"></td>
    								<td class="no-line"></td>
                    <td class="no-line"></td>
    								<td class="no-line text-center"><strong>Grand Total</strong></td>
    								<td class="no-line text-right">$ {{ $orderDetails->grand_total }}</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
