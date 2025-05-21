package com.restaurant.model;


    public class MyQueue<T> {
        private Object[] items;
        private int front, rear, size, capacity;

        public MyQueue(int capacity) {
            this.capacity = capacity;
            this.items = new Object[capacity];
            this.front = 0;
            this.rear = -1;
            this.size = 0;
        }

        public void offer(T item) {
            if (size == capacity) {
                System.out.println("Queue is full!");
                return;
            }
            rear = (rear + 1) % capacity;
            items[rear] = item;
            size++;
        }

        public T poll() {
            if (isEmpty()) return null;
            T item = (T) items[front];
            front = (front + 1) % capacity;
            size--;
            return item;
        }

        public boolean isEmpty() {
            return size == 0;
        }

        public int size() {
            return size;
        }
    }


