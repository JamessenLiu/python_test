"""
    Class of websocket
"""
import json

from django.core.cache import cache
from django.conf import settings

from asgiref.sync import async_to_sync
from channels.generic.websocket import AsyncWebsocketConsumer
from channels.layers import get_channel_layer


class DeployResult(AsyncWebsocketConsumer):
    """
        Class of websocket
    """

    async def connect(self):
        """
        Establishing connection
        """
        socket_id = self.scope['url_route']['kwargs']['socket_id']
        socket_group = 'chat_%s' % socket_id
        await self.channel_layer.group_add(
            socket_group,
            self.channel_name
        )

        await self.accept()
        message = get_initial_message()
        await self.send(text_data=json.dumps({
            'code': message.get('code'),
            'message': message.get('message'),
            'data': message.get('data')
        }))

    async def system_message(self, event):
        """
        Receive message from socket group
        """
        message = event['message']
        await self.send(text_data=json.dumps({
            'code': message.get('code'),
            'message': message.get('message'),
            'data': message.get('data')
        }))


def send_group_msg(socket_id, message):
    """
    send message out of channels
    """
    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        f'chat_{socket_id}',
        {
            "type": "system_message",
            "message": message,
        }
    )


def get_initial_message():
    message = {
            "code": 200,
            "message": "SUCCESS",
        }
    return message


