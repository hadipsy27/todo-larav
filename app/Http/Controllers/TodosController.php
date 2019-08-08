<?php

namespace App\Http\Controllers;

use App\Todo; // tambahkan model Todo
use Illuminate\Http\Request;

class TodosController extends Controller
{
    public function index()
    {
        // return view('todos.index'); // menampilkan index
        // fetch all todos from database
        // display them in todos-index page
        // $todos = Todo::all();
        // return view('todos.index')->with('todos', $todos);
        // atau biar lebih simpel bisa di jadikan 
        // tetapi yang menjadi key untuk memanggil data menjadi "todos" di ('todos'. Todo::all())
        return view('todos.index')->with('todos', Todo::all()); // Todo::all(); tidak bisa mengguanakan model binding
    }

    // tanpa menggunakan model binding
    // $todoId dalam show($todoId) adalah dinamic parameter
    // yang di ambil dari Route
    // Route::get('/todos/{todo}', 'TodosController@show');
    // {todo} itu yang di ambil dari Route ke Controller
    // dan berlaku juga di dynamic parameter selanjutnya
    // public function show($todoId) *#
    // { *#
        // $todo = Todo::find($todoId); #
        // return view('todos.show')->with('todo', $todo); #
        // atau bisa juga
        // return view('todos.show')->with('todo', Todo::find($todoId)); *

    // } *#
    // menggunakan model binding
    // dari show($todoId) menjadi show(Todo $todo)
    // dan mengganti Todo::find($todoId) menjadi $todo
    // cara ini menjadi lebih efektif dan menghindari penggantian/penambahan/pengurangan address dalam url
    public function show(Todo $todo)
    {
        return view('todos.show')->with('todo',$todo);

    }

    public function create()
    {
        return view('todos.create');
    }

    public function store()
    {
        // dd(request());
        // dd(request()->all()); // json view

        // Langkah kedua membuat falidasi form jika tidak di isi
        // mengambil request() yaitu "ValidatesRequests" pada Controller.php
        $this->validate(request(),[
            // lalu membuat array validasi
            'name' => 'required|min:6|max:20',
            'description' => 'required'

        ],
        [
            'min'=> 'Nama yang anda masukkan kurang dari 6 karakter',
            'max' => 'Nama yang anda masukkan lebih dari 20 karakter',
            'required' => 'Form nama / deskripsi tidak boleh kosong'
            
        ]
        );
        // langkah pertama memasukkan data ke database
        $data = request()->all();

        $todo = new Todo();
        // $todo->name (name adalah nama dari form input nama)
        // lalu data di inputkan ke database dengan nama 'name'
        $todo->name = $data['name'];
        // $todo->descriptiron (name adalah nama dari form input description)
        // lalu data di inputkan ke database dengan nama 'description'
        $todo->description = $data['description'];
        $todo->completed = false;

        $todo->save();

        // membuat flas messaging
        session()->flash('success','Selamat, Todo Berhasil Dibuat.');

        return redirect("/todos");
    }

    // $todoId dalam edit($todoId) adalah dinamic parameter
    // public function edit($todoId) *
    // menggunakan model binding
    public function edit(Todo $todo)
    {
        // $todo = Todo::find($todoId); *

        return view('todos.edit')->with('todo', $todo);

    }

    // $todoId dalam update($todoId) adalah dinamic parameter
    // public function update($todoId) *
    // menggunakan model binding
    public function update(Todo $todo)
    {
        $this->validate(request(),[
            // lalu membuat array validasi
            'name' => 'required|min:6|max:20',
            'description' => 'required'

        ],
        [
            'min'=> 'Nama yang anda masukkan kurang dari 6 karakter',
            'max' => 'Nama yang anda masukkan lebih dari 20 karakter',
            'required' => 'Form nama / deskripsi tidak boleh kosong'
            
        ]
        );

        $data = request()->all();

        // $todo = Todo::find($todoId); *

        $todo->name = $data['name'];
        $todo->description = $data['description'];

        $todo->save();
        session()->flash('success','Selamat, Todo Berhasil di perbaharui.');
        return redirect('/todos');
    }
    
    // $todoId dalam destroy($todoId) adalah dinamic parameter
    // public function destroy($todoId) *
    // menggunakan model binding
    public function destroy(Todo $todo)
    {
        // $todo = Todo::find($todoId); *

        $todo->delete();
        session()->flash('success','Selamat, Todo Berhasil di buang dari muka bumi.');
        return redirect('/todos');
    }

    public function complete(Todo $todo)
    {
        $todo->completed = true;
        $todo->save();

        session()->flash('success','Todo telah lengkap (Completed) :V');

        return redirect('/todos');
    }
}
