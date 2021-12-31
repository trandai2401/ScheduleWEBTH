<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $user;
    public $message;
    public $congViec;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($user, $message, $congViec)
    {
        $this->user = $user;
        $this->message = $message;
        $this->congViec = $congViec;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel('chat');
    }

    public function broadcastWith()
    {
        return [

            'user' => $this->user,
            'message' => $this->message,
            'congViec' => $this->congViec
        ];
    }
}
