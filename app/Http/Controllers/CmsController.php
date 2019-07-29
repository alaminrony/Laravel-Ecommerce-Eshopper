<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\CmsPage;
use App\Contact;
use App\Category;

class CmsController extends Controller
{
    public function addCmsPage(Request $request){
      if($request->isMethod('post')){
        $data = $request->all();
        if(empty($data['meta_title'])){
          $data['meta_title']= "";
        }
        if(empty($data['meta_description'])){
          $data['meta_description']= "";
        }
        if(empty($data['meta_keywords'])){
          $data['meta_keywords']= "";
        }
        // echo "<pre>"; print_r($data);die;
        $cmspage = new CmsPage;
        $cmspage->title= $data['title'];
        $cmspage->url= $data['url'];
        $cmspage->description= $data['description'];
        $cmspage->meta_title= $data['meta_title'];
        $cmspage->meta_description= $data['meta_description'];
        $cmspage->meta_keywords= $data['meta_keywords'];
        if(empty($data['status'])){
          $status = 0;
        }else{
          $status = 1;
        }
        $cmspage->status= $status;
        $cmspage->save();
        return redirect()->back()->with('flash_message_success','CMS Page successfully added');

      }
      return view('admin.pages.add_cms_page');
    }

    public function viewCmsPage(){

      $CmsPages = CmsPage::get();
      // $CmsPages = json_decode(json_encode($CmsPages));
      // echo "<pre>"; print_r($CmsPages);die;
      return view('admin.pages.view_cms_page',compact('CmsPages'));
    }

    public function editCmsPage(Request $request,$id){
      if($request->isMethod('post')){
        $data = $request->all();
        if(empty($data['meta_title'])){
          $data['meta_title']= "";
        }
        if(empty($data['meta_description'])){
          $data['meta_description']= "";
        }
        if(empty($data['meta_keywords'])){
          $data['meta_keywords']= "";
        }
        // echo "<pre>"; print_r($data);die;
        if(empty($data['status'])){
          $status = 0;
        }else{
          $status = 1;
        }
        CmsPage::where('id',$id)->update(['title'=>$data['title'],'url'=>$data['url'],'description'=>$data['description'],'meta_title'=>$data['meta_title'],'meta_description'=>$data['meta_description'],'meta_keywords'=>$data['meta_keywords'],'status'=>$status]);
        return redirect()->back()->with('flash_message_success','Data Updated successfully');
      }
      $cmsPage = CmsPage::where('id',$id)->first();
      return view('admin.pages.edit_cms_page')->with(compact('cmsPage'));
    }


    public function deleteCmsPage($id){
      CmsPage::where('id',$id)->delete();
      return redirect('admin/view-cms-page')->with('flash_message_success','CMS Page deleted successfully');

    }

    public function CmsPage($url){
      //Redirect to 404 if CMS page Is disable or does not exists
      $cmsPageCount =CmsPage::where(['url'=>$url,'status'=>1])->count();
      if($cmsPageCount >0){
        $cmsPageDetails = CmsPage::where(['url'=>$url])->first();
        $meta_title = $cmsPageDetails->meta_title;
        $meta_description=$cmsPageDetails->meta_description;
        $meta_keywords=$cmsPageDetails->meta_keywords;
      }else{
        abort(404);
      }

      // Get All Categories and Sub Categories
      $categories_menu = "";
      $categories = Category::with('categories')->where(['parent_id' => 0])->get();
      $categories = json_decode(json_encode($categories));
      /*echo "<pre>"; print_r($categories); die;*/
    foreach($categories as $cat){
      $categories_menu .= "
      <div class='panel-heading'>
        <h4 class='panel-title'>
          <a data-toggle='collapse' data-parent='#accordian' href='#".$cat->id."'>
            <span class='badge pull-right'><i class='fa fa-plus'></i></span>
            ".$cat->name."
          </a>
        </h4>
      </div>
      <div id='".$cat->id."' class='panel-collapse collapse'>
        <div class='panel-body'>
          <ul>";
          $sub_categories = Category::where(['parent_id' => $cat->id])->get();
          foreach($sub_categories as $sub_cat){
            $categories_menu .= "<li><a href='#'>".$sub_cat->name." </a></li>";
          }
            $categories_menu .= "</ul>
        </div>
      </div>
      ";
    }
      return view('pages.cms_page')->with(compact('cmsPageDetails','categories_menu','categories','meta_title','meta_description','meta_keywords'));

    }

    public function contact(Request $request){
      if($request->isMethod('post')){
        $data= $request->all();

        $validator =$request->validate([
      'name' => 'required|regex:/^[\pL\s\-]+$/u|max:255',
      'email' => 'required|email',
      'subject'=>'required'
       ]);

        $contactData = new Contact;
        $contactData->name= $data['name'];
        $contactData->email= $data['email'];
        $contactData->subject= $data['subject'];
        $contactData->message= $data['message'];
        $contactData->save();
        return redirect()->back()->with('flash_message_success','Thanks for your enquiry, we will get back to you soon.');


      }
      // Get All Categories and Sub Categories
      $categories_menu = "";
      $categories = Category::with('categories')->where(['parent_id' => 0])->get();
      $categories = json_decode(json_encode($categories));
      /*echo "<pre>"; print_r($categories); die;*/
    foreach($categories as $cat){
      $categories_menu .= "
      <div class='panel-heading'>
        <h4 class='panel-title'>
          <a data-toggle='collapse' data-parent='#accordian' href='#".$cat->id."'>
            <span class='badge pull-right'><i class='fa fa-plus'></i></span>
            ".$cat->name."
          </a>
        </h4>
      </div>
      <div id='".$cat->id."' class='panel-collapse collapse'>
        <div class='panel-body'>
          <ul>";
          $sub_categories = Category::where(['parent_id' => $cat->id])->get();
          foreach($sub_categories as $sub_cat){
            $categories_menu .= "<li><a href='#'>".$sub_cat->name." </a></li>";
          }
            $categories_menu .= "</ul>
        </div>
      </div>
      ";
    }
    $meta_title="Contact Us | E-shop";
    $meta_description="Contact us for any queries to related our products";
    $meta_keywords="contact us, queries";
    return view('pages.contact')->with(compact('categories_menu','categories','meta_title','meta_description','meta_keywords'));
    }

    public function viewContacts(){
      $contactMessages= Contact::get();
      return view('admin.contacts.view_contacts',compact('contactMessages'));
    }


    public function replyMessage(Request $request, $id){
      if($request->isMethod('post')){

        $request->validate([
      'subject' => 'required',
      'message' => 'required',
       ]);

        $data = $request->all();
        $senderEmail =$data['email'];
        $messageData = [
          'name'=>$data['name'],
          'subject'=>$data['subject'],
          'messageBody'=>$data['message'],
        ];
        Mail::send('emails.reply_Messages',$messageData,function($message)use($senderEmail){
          $message->to($senderEmail)->subject('your replay here');
        });
        return redirect()->back()->with('flash_message_success','Email Send successfully');

      }
      $replyMessages= Contact::where('id',$id)->first();
      return view('admin.contacts.reply_Messages',compact('replyMessages'));
    }

    public function deleteContacts($id){
      Contact::where('id',$id)->delete();
      return redirect()->back()->with('flash_message_success','Message Delete successfully');
    }




}
