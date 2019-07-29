@extends('layouts.adminLayout.admin_design')
@section('content')

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Contacts</a> <a href="#" class="current">View Contacts</a> </div>
    <h1>Contacts</h1>
    @if(Session::has('flash_message_error'))
            <div class="alert alert-error alert-block">
                <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>{!! session('flash_message_error') !!}</strong>
            </div>
        @endif
        @if(Session::has('flash_message_success'))
            <div class="alert alert-success alert-block">
                <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>{!! session('flash_message_success') !!}</strong>
            </div>
        @endif
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>New Message ({{count($contactMessages)}})</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Subject</th>
                  <th>Message</th>
                  <th>Created on</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
              	@foreach($contactMessages as $contactMessage)
                <tr class="gradeX">
                  <td class="center">{{ $contactMessage->id }}</td>
                  <td class="center">{{ $contactMessage->name }}</td>
                  <td class="center">{{ $contactMessage->email }}</td>
                  <td class="center">{{ $contactMessage->subject }}</td>
                  <td class="center">{{str_limit($contactMessage->message,30)}}</td>
                  <td class="center">{{ $contactMessage->created_at }}</td>

                  <td class="center">
                    <a href="#myModal{{ $contactMessage->id }}" data-toggle="modal" class="btn btn-success btn-mini">View</a>
                    <a href="{{url('/admin/reply-message/'.$contactMessage->id)}}" class="btn btn-info btn-mini">Reply</a>
                    <a href="{{url('/admin/delete-contacts/'.$contactMessage->id)}}" class="btn btn-danger btn-mini">Delete</a>

                    <div id="myModal{{ $contactMessage->id }}" class="modal hide">
                      <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button">×</button>
                        <h3>{{ $contactMessage->name }} Message Details</h3>
                      </div>
                      <div class="modal-body">
                        <p><strong>Message ID</strong>: {{ $contactMessage->id }}</p>
                        <p><strong>Sender Name</strong>: {{ $contactMessage->name }}</p>
                        <p><strong>Sender Email</strong>: {{ $contactMessage->email }}</p>
                        <p><strong>Subject</strong>: {{ $contactMessage->subject }}</p>
                        <p><strong>Message</strong>: {{ $contactMessage->message }}</p>
                      </div>
                    </div>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Read Message</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Subject</th>
                  <th>Message</th>
                  <th>Created on</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
              	@foreach($contactMessages as $contactMessage)
                <tr class="gradeX">
                  <td class="center">{{ $contactMessage->id }}</td>
                  <td class="center">{{ $contactMessage->name }}</td>
                  <td class="center">{{ $contactMessage->email }}</td>
                  <td class="center">{{ $contactMessage->subject }}</td>
                  <td class="center">{{str_limit($contactMessage->message,30)}}</td>
                  <td class="center">{{ $contactMessage->created_at }}</td>

                  <td class="center">
                    <a href="#myModal{{ $contactMessage->id }}" data-toggle="modal" class="btn btn-success btn-mini">View</a>
                    <a href="" class="btn btn-danger btn-mini deleteRecord">Delete</a>

                    <div id="myModal{{ $contactMessage->id }}" class="modal hide">
                      <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button">×</button>
                        <h3>{{ $contactMessage->name }} Message Details</h3>
                      </div>
                      <div class="modal-body">
                        <p><strong>Message ID</strong>: {{ $contactMessage->id }}</p>
                        <p><strong>Sender Name</strong>: {{ $contactMessage->name }}</p>
                        <p><strong>Sender Email</strong>: {{ $contactMessage->email }}</p>
                        <p><strong>Subject</strong>: {{ $contactMessage->subject }}</p>
                        <p><strong>Message</strong>: {{ $contactMessage->message }}</p>
                      </div>
                    </div>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div> -->

</div>


@endsection
