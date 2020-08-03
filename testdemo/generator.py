import dotted
import my_pb2
import my_pb2_grpc


def grpc_hook(server):
    my_pb2_grpc.add_MYServicer_to_server(MYServicer(), server)



class MYServicer(my_pb2_grpc.MYServicer):

    def GetPage(self, request, context):
        response = my_pb2.PageResponse(title="Demo object")
        return response