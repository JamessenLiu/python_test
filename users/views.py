from django.shortcuts import render
from grpc_django.views import RetrieveGRPCView, ServerStreamGRPCView
from .user_pb2 import User as UserProto
from django.contrib.auth.models import User
from .serializers import UserSerializer

class GetUser(RetrieveGRPCView):

    queryset = User.objects.all()
    response_proto = UserProto
    serializer_class = UserSerializer

class ListUsers(ServerStreamGRPCView):

    queryset = User.objects.all()
    response_proto = UserProto
    serializer_class = UserSerializer

