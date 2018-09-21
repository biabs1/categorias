int cronometro(int seg) {
    for (seg;;seg--) {
        if (seg==0) {
            system("clear");
            printf("\n\n00:00\n");
            sleep(1);
            return 0;
        }
        system("clear");
        printf("\n\n00:%02d", seg);
        sleep(1);
    }
    return 0;
}
