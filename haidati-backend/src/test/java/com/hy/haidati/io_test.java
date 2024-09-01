package com.hy.haidati;

import io.reactivex.Scheduler;
import io.reactivex.schedulers.Schedulers;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class io_test {
    @Test
    void test() {
        Scheduler io = Schedulers.io();
        while (true) {
            io.scheduleDirect(() -> {
                System.out.println(Thread.currentThread().getName() + " print hello");
                try {
                    Thread.sleep(50000l);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
        }
    }
}
