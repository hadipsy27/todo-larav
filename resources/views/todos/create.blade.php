@extends('layouts.app')


@section('content')

<h1 class="text-center my-4">Create Todos</h1>

<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card card-default">
            <div class="card-header">Create New Todo</div>
            <div class="card-body">
                {{-- validasi form --}}
                @if ($errors->any())
                <div class="alert alert-danger">
                    <ul class="list-group">
                        @foreach ($errors->all() as $error)
                        <li class="list-group-item">
                            {{ $error }}
                        </li>
                        @endforeach
                    </ul>
                </div>
            @endif
                <form action="/store-todos" method="post">
                    @csrf
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Name" value="{{old('name')}}" name="name">
                    </div>
                    <div class="form-group">
                    <textarea name="description" placeholder="Description" cols="5" rows="5" class="form-control">{{old('description')}}</textarea>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-success">Create Todo</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    
@endsection