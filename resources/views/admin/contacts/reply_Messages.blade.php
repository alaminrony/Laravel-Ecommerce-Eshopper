@extends('layouts.adminLayout.admin_design')
@section('content')

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Reply Message</a> <a href="#" class="current">Reply Message</a> </div>
    <h1>Reply Message</h1>
    @if ($errors->any())
      <div class="alert alert-danger">
          <ul>
              @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
              @endforeach
          </ul>
      </div>
  @endif
        @if(Session::has('flash_message_success'))
            <div class="alert alert-success alert-block">
                <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>{!! session('flash_message_success') !!}</strong>
            </div>
        @endif
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Reply Message</h5>
          </div>
          <div class="widget-content nopadding">
            <form enctype="multipart/form-data" class="form-horizontal" method="post" action="" name="edit_cms_page"  novalidate="novalidate">{{ csrf_field() }}

                <input type="hidden" name="name" value="{{$replyMessages->name}}">

              <div class="control-group">
                <label class="control-label">To Email</label>
                <div class="controls">
                  <input type="text" name="email" value="{{$replyMessages->email}}">
                </div>
              </div>

              <div class="control-group">
                <label class="control-label">Subject</label>
                <div class="controls">
                  <input type="text" name="subject" >
                </div>
              </div>

              <div class="control-group">
                <label class="control-label">Message</label>
                <div class="controls">
                  <textarea name="message" ></textarea>
                </div>
              </div>

              <div class="form-actions">
                <input type="submit" value="Send" class="btn btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection
